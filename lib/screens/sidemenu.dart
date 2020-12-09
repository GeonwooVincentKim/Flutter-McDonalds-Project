import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myTestApp_Test/provider/provider_theme.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:provider/provider.dart';


class SideMenu extends StatefulWidget {
  final bool darkThemeEnabled;
  SideMenu({this.darkThemeEnabled});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ProviderThemeDynamic>(context);  
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
            title: Text("Test"),
            trailing: Switch(
              value: themeProvider.getDarkMode(),
              onChanged: (value){
                setState(() {
                  themeProvider.changeMode(value);
                });
              }
            ),
          ),
        ],
      )
    );
  }
}