import 'dart:developer' as developer;
import 'dart:io';


class AppLogger {
  AppLogger._();

  /// Colors
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _cyan = '\x1B[36m';

  // static const String _black = '\x1B[30m';
  // static const String _yellow = '\x1B[33m';
  // static const String _blue = '\x1B[34m';
  // static const String _magenta = '\x1B[35m';

  static void _log(
    String color,
    String type,
    Object msg, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    Platform.isIOS
        ? developer.log(
            msg.toString(),
            name: type,
            error: error,
            stackTrace: stackTrace,
          )
        : developer.log(
            '$color${msg.toString()}$_reset',
            name: type,
            error: error,
            stackTrace: stackTrace,
          );
  }

  static void info(
    Object msg, {
    AppLoggerType? type,
    bool sentry = true,
  }) =>
      _log(
        _cyan,
        '${_getTypeName(type)} 📘',
        msg,
      );

  static void success(
    Object msg, {
    AppLoggerType? type,
    bool sentry = true,
  }) =>
      _log(
        _green,
        '${_getTypeName(type)} ✅',
        msg,
      );

  static void error(
    Object msg, {
    AppLoggerType? type,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _log(
        _red,
        '${_getTypeName(type)} 🛑',
        msg,
        error: error,
        stackTrace: stackTrace,
      );

  static String _getTypeName(AppLoggerType? type) => type?.name ?? "CLEEKSY";
}

enum AppLoggerType {
  HTTP,
  NET_WORK,
  WEB_SOCKET,
  FIREBASE,
}
