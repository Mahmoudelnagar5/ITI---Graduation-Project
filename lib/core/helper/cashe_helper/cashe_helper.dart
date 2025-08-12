import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // ───── Singleton Pattern ─────
  static final CacheHelper _instance = CacheHelper._internal();

  factory CacheHelper() => _instance;

  CacheHelper._internal();

  // ───── Storage Instances ─────
  late SharedPreferences _sharedPreferences;

  // ───── Initialization ─────
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // ───── Shared Preferences Methods ─────

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    throw Exception("Unsupported value type");
  }

  dynamic getData( {required String key}) {
    return _sharedPreferences.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }
}
