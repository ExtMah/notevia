import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalSettingProvider extends ChangeNotifier {
  GlobalSettingProvider(this._sharedPreferences);
  bool get isDarkMode => _sharedPreferences.getBool('isDarkMode') ?? false;

  void toggleTheme(bool isOn) async {
    await _sharedPreferences.setBool('isDarkMode', isOn);
    notifyListeners();
  }

  final SharedPreferences _sharedPreferences;
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600),
    cardColor: Colors.blueGrey.shade700,
    unselectedWidgetColor: const Color(0xFF2c3037),
    backgroundColor: const Color(0xFF2c3037),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xFF27282f),
      selectedColor: Color(0xFF27282f),
    ),
    // shadowColor: Colors.black54,
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white)),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFeff0f2),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600),
    // cardColor: const Color(0xFFeff0f2),
    cardColor: const Color(0xffe5e5e5),
    unselectedWidgetColor: Colors.white,
    backgroundColor: const Color(0xFF2c3037),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.grey[50],
      selectedColor: const Color(0xFF27282f),
    ),
    // shadowColor: Colors.grey[100],
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.black)),
  );
}
