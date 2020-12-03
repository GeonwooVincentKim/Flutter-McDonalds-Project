import 'package:flutter/material.dart';
import 'package:myTestApp/shared/style/style.dart';


class SideMenu extends StatelessWidget {
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
          ListTile(title: Text("Filter"), onTap: (){Navigator.pushNamed(context, "/filter");})
        ],
      )
    );
  }
}