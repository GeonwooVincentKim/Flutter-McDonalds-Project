import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
   
class DynamicThemeProvider with ChangeNotifier {  
  bool isDarkMode = false;  
  getDarkMode() => this.isDarkMode;  
  void changeDarkMode(isDarkMode) {  
    this.isDarkMode = isDarkMode;  
    notifyListeners(); // Notify all it's listeners about update. If you comment this line then you will see that new added items will not be reflected in the list.  
  } 
}  

final darkTheme = ThemeData(
  primarySwatch: Colors.orange[200],
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