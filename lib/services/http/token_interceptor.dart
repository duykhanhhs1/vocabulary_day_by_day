import 'dart:io';

import 'package:vocabulary_day_by_day/common/utils/app_logger.dart';
import 'package:vocabulary_day_by_day/services/storages/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/configs/keys.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  TokenInterceptor(this._dio);

  SharedPreferences get _store => AppStorage.instance.prefs;
  final Dio _dio;


  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = _store.getString(AppStorageKey.ACCESS_TOKEN);
    options.headers.addAll({
      HttpHeaders.authorizationHeader:
          '${AppStorageKey.TOKEN_TYPE} $accessToken',
      'platform': 'mobile',
    });
    AppLogger.info(
      "${options.method}: ${options.path}",
      type: AppLoggerType.HTTP,
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.success(
      "${response.requestOptions.method}: ${response.requestOptions.path}",
      type: AppLoggerType.HTTP,
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    AppLogger.error(
      '[${err.response?.statusCode ?? err.type}] => ${err.requestOptions.method}: ${err.requestOptions.path}',
      type: AppLoggerType.HTTP,
    );

    final requestOptions = err.requestOptions;

    //Assume 401 stands for token expired
    if (err.response?.statusCode == 401) {
      // final String refreshToken =
      //     _store.read(AppStorageKey.REFRESH_TOKEN) ?? '';
      // if (refreshToken.isNotEmpty) {
      //   await _authController.checkRefreshToken();
      //   if (_authController.rfTokenStatus == LoadStatusEnum.success) {
      //     // retry with new token
      //     await _dio.fetch(requestOptions).then(
      //       (r) => handler.resolve(r),
      //       onError: (e) {
      //         handler.next(e);
      //       },
      //     );
      //   }
      // }
      return;
    } else {
      final retryCount = requestOptions.extra["retry_count"] ?? 0;
      requestOptions.extra["retry_count"] = retryCount + 1;

      if (err.type == DioExceptionType.unknown && retryCount < 1) {
        //retry only 1 more time if catch DioExceptionType.unknown
        await _dio.fetch(requestOptions).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.next(e);
          },
        );
        return;
      }
    }

    return handler.next(err);
  }
}
