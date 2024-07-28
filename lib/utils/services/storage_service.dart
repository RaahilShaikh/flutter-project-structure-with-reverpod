import 'package:project_structure_with_riverpod/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<SharedPreferences> get _instance async => _sharedPreferences ??= await SharedPreferences.getInstance();
  static SharedPreferences? _sharedPreferences;

  /// ============ for initialization  ============
  static Future<SharedPreferences?> init() async {
    Console.debugPrint(msg: "SharedPreferences init called");
    _sharedPreferences = await _instance;
    return _sharedPreferences;
  }

  /// ============ for clear the preferences  ============
  static void clear() async {
    Console.debugPrint(msg: "SharedPreferences clear called");
    _sharedPreferences?.clear();
  }

  /// ============ for token ============
  static void setAccessToken(String value) {
    _sharedPreferences?.setString(PrefsConst.accessToken, value);
  }

  static String getAccessToken() {
    return _sharedPreferences?.getString(PrefsConst.accessToken) ?? '';
  }
}
