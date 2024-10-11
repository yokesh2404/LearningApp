import 'package:kurups_app/utils/helper/encryption_decryption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  SharedPrefController._privateConstructor();

  static final SharedPrefController instance =
      SharedPrefController._privateConstructor();

  static SharedPreferences? _preferences;

  Future<SharedPreferences> get preference async {
    if (_preferences != null) return _preferences!;

    _preferences = await init();
    return _preferences!;
  }

  Future<SharedPreferences> init() async {
    final _sharedPref = await SharedPreferences.getInstance();

    return _sharedPref;
  }

  setStringData({required String key, dynamic data}) async {
    final sharedPreferences = await preference;
    var encrypt = EncryptData.encryptAES(data);
    sharedPreferences.setString(key, encrypt);
  }

  getStringData({required String key}) async {
    final sharedPreferences = await preference;
    var str = sharedPreferences.getString(key);
    if (str != null) {
      var decrypt = EncryptData.decryptAES(str);
      return decrypt;
    }
    return "";
  }

  setBoolData({required String key, required bool value}) async {
    final sharedPreferences = await preference;
    sharedPreferences.setBool(key, value);
  }

  getBoolData({required String key}) async {
    final sharedPreferences = await preference;
    var data = await sharedPreferences.getBool(key);

    return data ?? false;
  }
}
