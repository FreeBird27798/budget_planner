import 'package:budget_planner/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefController {
  final String isFirstTimeKey = 'isFirstTime';
  final String langCodeKey = 'language_code';
  final String isLoggedInKey = 'isLoggedIn';

  // final String isShowingKey = 'isShowing';

  static final AppPrefController _instance = AppPrefController._internal();
  late SharedPreferences _sharedPreferences;

  AppPrefController._internal();

  factory AppPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get pref => _sharedPreferences;

  Future<bool> setIsFirstTime(bool isFirstTime) async {
    return await _sharedPreferences.setBool(isFirstTimeKey, isFirstTime);
  }

  bool get isFirstTime => _sharedPreferences.getBool(isFirstTimeKey) ?? true;

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  //Lang
  Future<bool> setLanguage(String languageCode) async {
    return await _sharedPreferences.setString(langCodeKey, languageCode);
  }

  String get languageCode {
    return _sharedPreferences.getString(langCodeKey) ?? 'en';
  }

  //USER
  Future<void> saveUser({required User user}) async {
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('name', user.name);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setInt('currencyId', user.currencyId);
    await _sharedPreferences.setDouble('dayLimit', user.dayLimit);
    await _sharedPreferences.setInt('pin', user.pin);
  }

  User get user {
    User user = User();
    user.id = _sharedPreferences.getInt('id') ?? 0;
    user.name = _sharedPreferences.getString('name') ?? '';
    user.email = _sharedPreferences.getString('email') ?? '';
    user.currencyId = _sharedPreferences.getInt('currencyId') ?? 0;
    user.dayLimit = _sharedPreferences.getDouble('dayLimit') ?? 0;
    user.pin = _sharedPreferences.getInt('pin') ?? 0;
    return user;
  }

  bool get loggedIn => _sharedPreferences.getBool(isLoggedInKey) ?? false;

  Future<bool> setIsLoggedIn(bool loggedIn) async {
    return await _sharedPreferences.setBool(isLoggedInKey, loggedIn);
  }

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
