import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._();

  static final AppStorage instance = AppStorage._();

  late SharedPreferences prefs;

  Future<void> init() async {
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
    }
  }
}
