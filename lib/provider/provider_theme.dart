import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class ProviderThemeDynamic with ChangeNotifier{
  bool isDark = false;
  getDarkMode() => this.isDark;
  void changeMode(isDark){
    this.isDark = isDark;
    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  bottomAppBarColor: Colors.blue,
  buttonColor: Colors.cyan[300],
  scaffoldBackgroundColor: Color(0xFF212121),
  textSelectionColor: Colors.teal
);

final lightTheme = ThemeData(
  primaryColor: basicAppBarColor,
  brightness: Brightness.light,
  buttonColor: alertButtonColor,
  bottomAppBarColor: Colors.blue,
  scaffoldBackgroundColor: basicBackgroundColor,
  accentColor: Colors.blue,
);