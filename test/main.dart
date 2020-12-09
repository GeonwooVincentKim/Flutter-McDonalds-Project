import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/body.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'test_body.dart';
import 'test_page.dart';
import 'test_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DynamicThemeProvider()),
      ],
      child: MyAppSub()
    );
  }
}

class MyAppSub extends StatelessWidget {
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicThemeProvider>(context); 
    return MaterialApp(
      theme: themeProvider.getDarkMode() ? darkTheme : lightTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => TestBody(),
        "/detail": (context) => TestPage()
      },
      onGenerateRoute: (settings) {
        final List<String> routeGenerator = settings.name.split("/");
        if(routeGenerator[0] != '') return null;
        if(routeGenerator[1] == '/test'){
          String detailID = routeGenerator[2];
          // return MaterialPageRoute(builder: (context) => TestPage(testID: detailID));
        }
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}
