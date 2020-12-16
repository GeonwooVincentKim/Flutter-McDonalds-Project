import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProviderThemeDynamic with ChangeNotifier{
  bool isDark = false;
  getDarkMode() => this.isDark;
  void changeMode(isDark){
    this.isDark = isDark;
    notifyListeners();
  }

  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ProviderThemeDynamic() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme(){
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_pref == null)
      _pref  = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
      await _initPrefs();
      _darkTheme = _pref.getBool(key) ?? true;
      notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}
