import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
   
class DynamicThemeProvider with ChangeNotifier {  
  // ChangeNotifier : will provide a notifier for any changes in the value to all it's listeners  
  ThemeData _themeData;
  DynamicThemeProvider(this._themeData);

  getTheme() => _themeData;
  setTheme(ThemeData themeData) async{
    _themeData = themeData;
    notifyListeners();
  }

  bool isDarkMode = false;  
  getDarkMode() => this.isDarkMode;  
  void changeDarkMode(isDarkMode) {  
    this.isDarkMode = isDarkMode;  
    notifyListeners(); // Notify all it's listeners about update. If you comment this line then you will see that new added items will not be reflected in the list.  
  } 

  void changeBrightness(BuildContext context){
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}  

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);