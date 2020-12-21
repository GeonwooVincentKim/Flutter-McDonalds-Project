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
  // Stores Data key-value pair in the AOS & iOS.
  // It's a DB that can stores simple things.
  // Like a state of some variable or status, etc..
  SharedPreferences _pref;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  // Initializer of ProviderThemeDynamic Provider-Class.
  ProviderThemeDynamic() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  // Switch Button
  switchTheme(){
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  // Initialize the status of Widget Themes.
  _initPrefs() async {
    if(_pref == null)
      _pref  = await SharedPreferences.getInstance();
  }

  // Bring the status of Widget Themes.
  _loadFromPrefs() async {
      await _initPrefs();
      _darkTheme = _pref.getBool(key) ?? true;
      notifyListeners();
  }

  // Save the status of Widget Themes in '_initPref 
  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}
