import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';


class ProviderThemeDynamic with ChangeNotifier{
  bool isDark = false;
  getDarkMode() => this.isDark;
  void changeMode(isDark){
    this.isDark = isDark;
    notifyListeners();
  }
}

final darkTheme = ThemeData(
  // primarySwatch: Colors.orange[200],
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  // backgroundColor: const Color(0xFF212121),
  // accentColor: Colors.white,
  // accentIconTheme: IconThemeData(color: Colors.black),
  // dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  // primarySwatch: Colors.grey,
  primaryColor: BasicAppBarColor,
  brightness: Brightness.light,
  // backgroundColor: const Color(0xFFE5E5E5),
  // accentColor: Colors.black,
  // accentIconTheme: IconThemeData(color: Colors.white),
  // dividerColor: Colors.white54,
);