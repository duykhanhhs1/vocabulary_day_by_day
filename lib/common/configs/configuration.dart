import 'dart:async';

import 'package:vocabulary_day_by_day/di/di.dart';
import 'package:vocabulary_day_by_day/services/http/http.service.dart';
import 'package:vocabulary_day_by_day/services/storages/app_storage.dart';
import 'package:flutter/material.dart';

bool isSamsungKeyboard = false;

class AppConfiguration {
  AppConfiguration._();

  static final AppConfiguration instance = AppConfiguration._();

  Future<void> init() async {
    configureDependencies();
    WidgetsFlutterBinding.ensureInitialized();
    await AppStorage.instance.init();

    HttpService.instance.init();
  }
}
