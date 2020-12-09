import 'package:flutter/material.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/provider/provider_theme.dart';
import 'package:myTestApp_Test/provider/provider_user.dart';
import 'package:myTestApp_Test/screens/body.dart';
import 'package:myTestApp_Test/screens/create-edit-user/create_new_menu.dart';
import 'package:myTestApp_Test/screens/create-edit-user/edit_user.dart';
import 'package:myTestApp_Test/screens/create-edit-user/filter.dart';
import 'package:myTestApp_Test/screens/main_screen/cart.dart';
import 'package:myTestApp_Test/screens/main_screen/details.dart';
import 'package:myTestApp_Test/screens/main_screen/orders.dart';
import 'package:myTestApp_Test/screens/main_screen/settings.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

// ThemeData _lightTheme = ThemeData(
//   accentColor: Colors.pink,
//   brightness: Brightness.light,
//   primaryColor: Colors.blue
// );

// ThemeData _darkTheme = ThemeData(
//   accentColor: Colors.red,
//   brightness: Brightness.dark,
//   primaryColor: Colors.amber,
//   buttonTheme: ButtonThemeData(
//     buttonColor: Colors.amber
//   )
// );
// bool _light = true;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProviderMenu()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => ProviderThemeDynamic()),
      ],
      child: MyAppSub()
    );
  }
}

class MyAppSub extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ProviderThemeDynamic>(context);
    return MaterialApp(
      title: "McDonaldsApp",
      theme: themeProvider.getDarkMode() ? darkTheme : lightTheme,
      // theme: _light ? _lightTheme : _darkTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => Body(),
        '/settings': (context) => Settings(),
        '/settings/modify': (context) => EditUser(),
        // '/cart': (context) => Cart(title: "Cart", cartColor: BasicAppBarColor),
        '/cart': (context) => Cart(title: "Cart"),
        // '/orders': (context) => Orders(title: "Orders", ordersColor: BasicAppBarColor),
        '/orders': (context) => Orders(title: "Orders"),
        '/mainMenu/createMenu': (context) => CreateNewMenu(),
      },
      onGenerateRoute: (settings) {
        final List<String> pathElements = settings.name.split("/");
        if(pathElements[0] != '') return null;
        if(pathElements[1] == 'food'){
          String foodID = pathElements[2];
          // MaterialPageRoute(builder: (BuildContext build){
            
          // }; 
          
          return MaterialPageRoute(builder: (BuildContext context) => Details(menuID: foodID)); 
          // return MaterialPageRoute(builder: (BuildContext context) => Details(backgroundColor: BasicAppBarColor, menuID: foodID));
        }else if(pathElements[1] == 'detail'){
          String foodID = pathElements[2];
          return MaterialPageRoute(builder: (BuildContext context) => MyApp());
        }else if(pathElements[1] == 'filter'){
          return MaterialPageRoute(builder: (BuildContext context) => Filter(settings.arguments));
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) => MyApp());
      },
    );
  }
}