import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:vocabulary_day_by_day/common/utils/app_logger.dart';
import 'package:dio/dio.dart';

class ExceptionUtil {


  static SystemFailure failure(Object e) {
    AppLogger.error(e);
    //
    ErrorEntity? error;
    try {
      if (e is DioException) {
        if (e.response?.statusCode == 502 || e.response?.statusCode == 503) {
          error = ErrorEntity(
            statusCode: e.response!.statusCode,
            message: "Hệ thống đang bảo trì. Vui lòng thử lại sau",
          );
        } else if (e.response?.data != null) {
          String? message;
          try {
            message = e.response!.data["message"];
          } catch (e) {}
          error = ErrorEntity(
            statusCode: e.response!.statusCode,
            message: message,
          );
        } else {
          error = ErrorEntity(
            message: "networkIsNotAvailable",
            networkIsNotAvailable: true,
          );
        }
      } else if (e is ErrorEntity) {
        error = e;
      }
    } catch (e) {}
    return SystemFailure(error: error);
  }

  static CacheFailure cacheFailure(Object? e) {
    final String message = e.toString();

    return CacheFailure(error: ErrorEntity(message: message));
  }
}
