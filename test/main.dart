import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/body.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';
import 'test_body.dart';
import 'test_provider.dart';

void main() => runApp(MyApp());

//Using Bloc
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DynamicThemeProvider(darkTheme)),
      ],
      child: MyAppSub()
    // return MultiProvider(
    //   providers: [

    //   ],
    //   child: DynamicTheme(
    //     defaultBrightness: Brightness.dark,
    //     data: (brightness) => ThemeData(
    //       primarySwatch: Colors.blue,
    //       brightness: brightness
    //     ),
    //     themedWidgetBuilder: (context, snapshot) {
    //       return MaterialApp(
    //         theme: snapshot,
    //         initialRoute: "/",
    //         routes: {
    //           "/": (context) => Body(title: "HI")
    //         },
    //         onGenerateRoute: (settings) {
    //           final List<String> routeGenerator = settings.name.split("/");
    //           if(routeGenerator[0] != '') return null;
    //           if(routeGenerator[1] == 'test'){
    //             String subRouteID = routeGenerator[2];
    //             return MaterialPageRoute(builder: (BuildContext context) => Test(testID: subRouteID));
    //           }
    //         },
    //         onUnknownRoute: (settings) => MaterialPageRoute(builder: (BuildContext context) => Body()),
    //       );
    //     },
    //   )
    // );
    // return StreamBuilder(
    //   stream: bloc.darkThemeEnabled,
    //   initialData: false,
    //   builder: (context, snapshot) => MaterialApp(
    //       theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
    //       home: HomePage(snapshot.data)),
    // );
    );
  }
}

class MyAppSub extends StatelessWidget {
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicThemeProvider>(context); 
    // return DynamicTheme(
    //   defaultBrightness: Brightness.light,
    //   data: (brightness) => ThemeData(
    //     primarySwatch: Colors.indigo,
    //     brightness: brightness
    //   ),
    //   themedWidgetBuilder: (context, theme){
    //     return MaterialApp(
    //       theme: theme,
    //     );
    //   },
    // );
    return MaterialApp(
      // theme: themeProvider.getTheme(), 
      // theme: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
      theme: themeProvider.getDarkMode() ? ThemeData(
        // primarySwatch: Colors.black,
        primaryColor: Colors.black,
        brightness: Brightness.dark
      ) : 
      ThemeData(
        // primarySwatch: Colors.white,
        primaryColor: BasicAppBarColor,
        brightness: Brightness.light
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => TestBody(),
      },
      onGenerateRoute: (settings) {
        final List<String> routeGenerator = settings.name.split("/");
        if(routeGenerator[0] != '') return null;
        if(routeGenerator[1] == '/detail'){
          String detailID = routeGenerator[2];
          // return MaterialPageRoute(builder: (context) => Test());
        }
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}
