import 'dart:io';

import 'package:vocabulary_day_by_day/common/configs/info.dart';
import 'package:vocabulary_day_by_day/common/utils/app_logger.dart';
import 'package:vocabulary_day_by_day/services/http/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:path_provider/path_provider.dart';

class HttpResponse<T> {
  HttpResponse({
    this.body,
    this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T? body;
  Headers? headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;

  bool get noContentStatus => statusCode == 204;
}

class HttpService {
  HttpService._();

  static final HttpService instance = HttpService._();

  late Dio _dio;
  late Dio _anonymousDio;

  void init() {
    final _baseOptions = BaseOptions(
        baseUrl: AppFlavor.apiUrl,
        contentType: Headers.jsonContentType,
        headers: {
          'platform': 'mobile',
        });
    _dio = Dio(_baseOptions);
    if (Platform.isIOS || Platform.isMacOS || Platform.isAndroid) {
      _dio.httpClientAdapter = NativeAdapter();
    }
    _anonymousDio = Dio(_baseOptions);
  }

  String? getUriQueryParam(Uri uri, String key) {
    final queryParams = uri.queryParametersAll.entries.toList();
    if (queryParams.any((_) => _.key == key)) {
      return queryParams.firstWhere((_) => _.key == key).value.first;
    }
    return null;
  }

  FormData mapToFormData(Map<String, dynamic> map) {
    final formData = FormData.fromMap(map);
    final FormData newData = FormData();

    ///
    formData.fields.forEach((element) {
      newData.fields.add(MapEntry(element.key, element.value));
    });

    ///
    formData.files.forEach((element) {
      if (element.key.contains('[') || element.key.contains(']')) {
        final newKey =
            element.key.replaceAllMapped(RegExp('([+[a-zA-Z]+])'), (m) {
          return '${m[0]}'.replaceAll('[', '.').replaceAll(']', '');
        });
        final newValue = element.value;
        final newEntry = MapEntry(newKey, newValue);
        newData.files.add(newEntry);
      } else {
        newData.files.add(element);
      }
    });

    return newData;
  }


  Future<HttpResponse> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    final Response response = await _getDio().get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<HttpResponse> refreshToken(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    AppLogger.info("--[REFRESH TOKEN]--: $url", type: AppLoggerType.HTTP);
    final Response response = await _anonymousDio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );

    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<void> downloadAwsFileStorage(String url, String path,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    AppLogger.info("--[DOWNLOAD]--: $url", type: AppLoggerType.HTTP);
    await _anonymousDio
        .download(url, path,
            onReceiveProgress: onReceiveProgress, options: options)
        .then((response) async {
      AppLogger.success("--[DOWNLOAD]--: $url", type: AppLoggerType.HTTP);
    }, onError: (e) {
      throw e;
    });
  }

  Future<HttpResponse> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? formData,
    Function(int count, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    if (formData != null) {
      data = mapToFormData(formData);
    }
    final Response response = await _getDio().post(
      url,
      data: data,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      options: options,
      cancelToken: cancelToken,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<HttpResponse> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? formData,
  }) async {
    if (formData != null) {
      data = mapToFormData(formData);
    }
    final Response response = await _getDio().put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<HttpResponse> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await _getDio().delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<HttpResponse> deleteDeviceToken(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    AppLogger.info("--[DELETE]--: $url", type: AppLoggerType.HTTP);
    final Response response = await _anonymousDio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    AppLogger.success("--[DELETE]--: $url", type: AppLoggerType.HTTP);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<File> downloadAwsFile(
    String url,
    String filename, {
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final _filename = Uri.decodeFull(filename).replaceAll("UTF-8''", '');
      final Response response = await Dio().get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/$_filename');
      await file.writeAsBytes(response.data);
      return file;
    } catch (e) {
      throw FileSystemException(e.toString());
    }
  }

  Future<HttpResponse> request(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? formData,
      Function(int count, int total)? onSendProgress}) async {
    if (formData != null) {
      data = mapToFormData(formData);
    }
    final Response response = await _getDio().request(
      url,
      data: data,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<HttpResponse> fetch(RequestOptions options) async {
    final Response response = await _getDio().fetch(
      options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Dio _getDio() {
    _dio.interceptors
      ..clear()
      ..add(TokenInterceptor(_dio));
    return _dio;
  }
}
