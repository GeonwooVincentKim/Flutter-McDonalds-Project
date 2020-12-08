import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class Bloc{
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

class SideMenu extends StatelessWidget {
  final bool darkThemeEnabled;
  SideMenu({this.darkThemeEnabled});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: null,
            decoration: BoxDecoration(
              color: SideAppBarColor,
              image: DecorationImage(
                image: AssetImage("assets/basicimages/McDonaldsLogo.jpg"), fit: BoxFit.cover
              )
            ),
          ),
          ListTile(title: Text("Home"), onTap: () => Navigator.pushNamed(context, "/")),
          ListTile(title: Text("Cart"), onTap: (){Navigator.pushNamed(context, "/cart");}),
          ListTile(title: Text("Settings"), onTap: () => Navigator.pushNamed(context, "/settings")),
          ListTile(title: Text("Orders"), onTap: (){Navigator.pushNamed(context, "/orders");}),
          ListTile(title: Text("Create New Menu"), onTap: () => Navigator.pushNamed(context, "/mainMenu/createMenu")),
          ListTile(title: Text("Filter"), onTap: (){Navigator.pushNamed(context, "/filter");}),
          ListTile(
            title: Text("Dark Theme"),
            // trailing: Switch(
            //   value: darkThemeEnabled,
            //   onChanged: bloc.changeTheme
            // ),
          ),
        ],
      )
    );
  }
}