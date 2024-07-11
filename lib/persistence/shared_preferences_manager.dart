import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants/general_constants.dart';

class SharedPreferencesManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  /**
   * Set value of login status
   */
  Future<void> setStartLogin(bool startLogin) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(GeneralConstants.estado_login, startLogin);
  }

  /**
  * Get value of login status
  */
  Future<bool?> getLoginStatus() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(GeneralConstants.estado_login);
  }
}
