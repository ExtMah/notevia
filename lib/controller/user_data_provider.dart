import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  final SharedPreferences _preferences;
  UserDataProvider(this._preferences);

  bool get isLoggedIn => _preferences.getBool("isLoggedIn") ?? false;
}
