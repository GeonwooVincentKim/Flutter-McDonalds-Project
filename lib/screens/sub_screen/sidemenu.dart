import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(title: Text("Home"), onTap: () => Navigator.pushNamed(context, "/")),
          ListTile(title: Text("Create New Menu"), onTap: () => Navigator.pushNamed(context, "/")),
          ListTile(title: Text("Settings"), onTap: () => Navigator.pushNamed(context, "/")),
        ],
      )
    );
  }
}