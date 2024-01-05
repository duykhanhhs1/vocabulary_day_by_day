import 'package:hive_flutter/hive_flutter.dart';

class AppHive {
  AppHive._();

  static final AppHive instance = AppHive._();

  Future<void> init(String path) async => await Hive.initFlutter(path);

  static Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  static Future<List<dynamic>> getAll({required String boxName}) async {
    final Box box = await openBox(boxName);
    return box.values.toList();
  }

  static Future<int> getNumberValue({required String boxName}) async {
    final Box box = await openBox(boxName);
    return box.length;
  }

  static Future<dynamic> get(
      {required String boxName, required dynamic keyValue}) async {
    final Box box = await openBox(boxName);
    final result = await box.get(keyValue);
    await box.close();
    return result;
  }

  static Future<void> save(
      {required String boxName,
      required dynamic keyValue,
      required dynamic value}) async {
    final Box box = await openBox(boxName);
    await box.put(keyValue, value);
    await box.close();
  }

  static Future<void> replaceKey(
      {required String boxName,
      required dynamic oldKey,
      required dynamic newKey}) async {
    final currentValue = await get(boxName: boxName, keyValue: oldKey);
    await delete(boxName: boxName, keyValue: oldKey);
    await save(boxName: boxName, keyValue: newKey, value: currentValue);
  }

  static Future<int> add(
      {required String boxName, required dynamic value}) async {
    final Box box = await openBox(boxName);
    final result = await box.add(value);
    await box.close();
    return result;
  }

  static Future<List<int>> addAll(
      {required String boxName, required Iterable<dynamic> values}) async {
    final Box box = await openBox(boxName);
    return (await box.addAll(values)).toList();
  }

  static Future<void> delete(
      {required String boxName, required dynamic keyValue}) async {
    final Box box = await openBox(boxName);
    return await box.delete(keyValue);
  }

  static Future<int> clear({required String boxName}) async {
    final Box box = await openBox(boxName);
    final result = await box.clear();
    await box.close();
    return result;
  }
}
