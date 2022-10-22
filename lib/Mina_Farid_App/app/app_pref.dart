import 'package:shared_preferences/shared_preferences.dart';

const String pref_key_lang = "per_key_lag";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguages() async {
    String? langauge = _sharedPreferences.getString(pref_key_lang);
    if (langauge != null && langauge.isNotEmpty) {
      return langauge;
    } else {
      return 'en';
    }
  }
}
