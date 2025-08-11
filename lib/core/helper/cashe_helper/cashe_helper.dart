import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;
  CasheHelper._internal();
  static final CasheHelper _instance = CasheHelper._internal();
  factory CasheHelper() => _instance;

  Future<SharedPreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  Future<bool> saveData({required String key, required value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setStringList(key, value);
    }
  }

  Object? getData(String key) => sharedPreferences.get(key);

  Future<bool> removeData(String key) async =>
      await sharedPreferences.remove(key);
}