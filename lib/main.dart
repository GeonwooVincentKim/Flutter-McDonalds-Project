import 'package:flutter/material.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_home.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/provider/provider_theme.dart';
import 'package:myTestApp_Test/provider/provider_user.dart';
import 'package:myTestApp_Test/screens/body.dart';
import 'package:myTestApp_Test/screens/create-edit-user/create_new_menu.dart';
import 'package:myTestApp_Test/screens/create-edit-user/edit_user.dart';
import 'package:myTestApp_Test/screens/create-edit-user/filter.dart';
import 'package:myTestApp_Test/screens/main_screen/cart.dart';
import 'package:myTestApp_Test/screens/main_screen/details.dart';
import 'package:myTestApp_Test/screens/main_screen/food.dart';
import 'package:myTestApp_Test/screens/not_exist.dart';
import 'package:myTestApp_Test/screens/main_screen/orders.dart';
import 'package:myTestApp_Test/screens/main_screen/settings.dart';
import 'package:myTestApp_Test/screens/main_screen/special.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProviderCategory()),
        ChangeNotifierProvider(create: (_) => ProviderFood()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => ProviderThemeDynamic()),
        ChangeNotifierProvider(create: (_) => ProviderHome()),
      ],
      // child: MyAppSub()
      child: Consumer<ProviderThemeDynamic>(
        builder: (ctx, ProviderThemeDynamic themeDynamic, child){
          return MaterialApp(
            title: "McDonaldsApp",
            theme: themeDynamic.darkTheme ? dark : light,
            initialRoute: "/",
            routes: {
              "/": (context) => Body(),
              '/settings': (context) => Settings(title: "Settings"),
              '/settings/modify': (context) => EditUser(title: "Modify"),
              '/cart': (context) => Cart(title: "Cart"),
              '/orders': (context) => Orders(title: "Orders"),
              '/mainMenu/createMenu': (context) => CreateNewMenu(title: "Menu"),
              '/special': (context) => Special(title: "Special"),
            },
            onGenerateRoute: (settings) {
              final List<String> pathElements = settings.name.split("/");
              if(pathElements[0] != '') return null;
              if(pathElements[1] == 'food'){
                String foodID = pathElements[2];
                return MaterialPageRoute(builder: (BuildContext context) => Food(foodID: foodID));
              }else if(pathElements[1] == 'detail'){
                String foodID = pathElements[2];
                return MaterialPageRoute(builder: (BuildContext context) => Details(foodID: foodID));
              }else if(pathElements[1] == 'filter'){
                return MaterialPageRoute(builder: (BuildContext context) => Filter(settings.arguments));
              }else if(pathElements[1] == 'specialMenu'){
                String specialID = pathElements[2];
                return MaterialPageRoute(builder: (BuildContext context) => Details(foodID: specialID));
              }else if(pathElements[1] == 'home'){
                String homeID = pathElements[2];
                return MaterialPageRoute(builder: (BuildContext context) => NotExist(title: "Page does not exist"));
              }
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (BuildContext context) => NotExist(title: "Page does not exist"));
            },
          );
        }
      ),
    );
  }
}

class MyAppSub extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ProviderThemeDynamic>(context);
    return MaterialApp(
      title: "McDonaldsApp",
      theme: themeProvider.getDarkMode() ? dark : light,
      initialRoute: "/",
      routes: {
        "/": (context) => Body(),
        '/settings': (context) => Settings(title: "Settings"),
        '/settings/modify': (context) => EditUser(title: "Modify"),
        '/cart': (context) => Cart(title: "Cart"),
        '/orders': (context) => Orders(title: "Orders"),
        '/mainMenu/createMenu': (context) => CreateNewMenu(title: "Menu"),
        '/special': (context) => Special(title: "Special"),
      },
      onGenerateRoute: (settings) {
        final List<String> pathElements = settings.name.split("/");
        if(pathElements[0] != '') return null;
        if(pathElements[1] == 'food'){
          String foodID = pathElements[2];
          return MaterialPageRoute(builder: (BuildContext context) => Food(foodID: foodID));
        }else if(pathElements[1] == 'detail'){
          String foodID = pathElements[2];
          return MaterialPageRoute(builder: (BuildContext context) => Details(foodID: foodID));
        }else if(pathElements[1] == 'filter'){
          return MaterialPageRoute(builder: (BuildContext context) => Filter(settings.arguments));
        }else if(pathElements[1] == 'specialMenu'){
          String specialID = pathElements[2];
          return MaterialPageRoute(builder: (BuildContext context) => Details(foodID: specialID));
        }else if(pathElements[1] == 'home'){
          String homeID = pathElements[2];
          return MaterialPageRoute(builder: (BuildContext context) => NotExist(title: "Page does not exist"));
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) => NotExist(title: "Page does not exist"));
      },
    );
  }
}