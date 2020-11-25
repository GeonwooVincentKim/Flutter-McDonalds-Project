import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/providers/provider_user.dart';
import 'package:myTestApp/screens/create-edit-filter/create_new_detail_menu.dart';
import 'package:myTestApp/screens/create-edit-filter/create_new_menu.dart';
import 'package:myTestApp/screens/create-edit-filter/edit_user.dart';
import 'package:myTestApp/screens/menu/menu.dart';
import 'package:myTestApp/screens/menu/orders.dart';
// import 'package:myTestApp/screens/detail_menu/detail_menu.dart';
import 'package:myTestApp/screens/page_slider.dart';
import 'package:myTestApp/screens/menu/setting.dart';
import 'package:myTestApp/screens/menu/cart.dart';
import 'package:myTestApp/screens/sub_menu/details.dart';
import 'package:myTestApp/screens/sub_menu/sub_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:provider/provider.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  MenuModel submenuList;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => MainMenuProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: "Mcdonald Demo",
        initialRoute: "/",
        routes: {
          '/': (context) => PageSlider(),
          '/settings': (context) => Settings(),
          '/settings/modify': (context) => EditUser(),
          '/cart': (context) => Cart(title: "Cart", cartColor: BasicAppBarColor),
          '/orders': (context) => Orders(title: "Orders", ordersColor: BasicAppBarColor),
          
          // If cannot, it's ok to create 4 menus for control the list.
          // '/food/ham': (context) => DetailMenu(pageIndex: 0, ),
          // '/food/ham': (context) => Settings(),
          // '/food/dessert': (context) => myApp(),
          // '/food/morning': (context) => Settings(),
          // '/food/cafe': (context) => myApp(),
          // '/food': (context) => MenuDetail(),
          // '/food'
          // '/detail': (context) => myApp(),
          '/mainMenu/createMenu': (context) => CreateNewMenu(),
          '/createDetailMenu': (context) => CreateNewDetailMenu(),
        },
        onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split('/');
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'food'){
            String foodID = pathElements[2];
            
            // MenuDetails
            // Make sure not to set the MenuDetail constructor default.
            // return MaterialPageRoute(builder: (BuildContext context) => DetailMenu(pageIndex: 0, menuID: foodID, menuColor: BasicAppBarColor,));
            // return MaterialPageRoute(
            //   builder: (BuildContext context) {
            //     if(pathElements[3] == 'details'){
            //       String detailFoodID = pathElements[4];
            //       return Details(menuColor: BasicAppBarColor, menuID: detailFoodID);
            //     }
            //   }
            // );
            return MaterialPageRoute(builder: (BuildContext context) => SubMenu(menuColor: BasicAppBarColor, menuID: foodID));
            // return MaterialPageRoute(builder: (BuildContext context) => DetailMenu(title: submenuList.menuTitle, menuID: foodID);
          }else if(pathElements[1] == 'details'){
            String foodID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => Details(menuColor: BasicAppBarColor, menuID: foodID));
          }
        },
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (BuildContext context) => PageSlider());
        },
      )
    );
  }
}