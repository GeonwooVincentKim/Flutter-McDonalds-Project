import 'package:flutter/material.dart';
import 'package:myTestApp/provider/provider_user.dart';
import 'package:myTestApp/screens/body.dart';
import 'package:myTestApp/screens/create-edit-filter/create_category.dart';
import 'package:myTestApp/screens/create-edit-filter/create_new_menu.dart';
import 'package:myTestApp/screens/create-edit-filter/edit_user.dart';
import 'package:myTestApp/screens/main_screen/orders.dart';
import 'package:myTestApp/screens/main_screen/settings.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:provider/provider.dart';


void main() => runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: "McDonaldsApp",
        initialRoute: "/",
        routes: {
          "/": (context) => Body(),
          '/settings': (context) => Settings(),
          '/settings/modify': (context) => EditUser(),
          // '/cart': (context) => Cart(title: "Cart", cartColor: BasicAppBarColor),
          '/orders': (context) => Orders(title: "Orders", ordersColor: BasicAppBarColor),
          '/createCategory': (context) => CreateCategory(),
          '/mainMenu/createMenu': (context) => CreateNewMenu(),
        },
        onGenerateRoute: (settings) {
          final List<String> pathElements = settings.name.split("/");
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'food'){
            String foodID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => myApp());
          }else if(pathElements[1] == 'detail'){
            String foodID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => myApp());
          }else if(pathElements[1] == 'filter'){
            // return MaterialPageRoute(builder: (BuildContext context) => FilterPage(settings.arguments));
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (BuildContext context) => myApp());
        },
      ),
    );
  }
}