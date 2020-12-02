import 'package:flutter/material.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/style/style.dart';


class Menu extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;
  final Color homeColor;

  Menu({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo,
    @required this.homeColor
  });
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(widget.title),
      backgroundColor: BasicAppBarColor,
      centerTitle: true,
      actions: [

      ],
    );
  }

  Widget _buildMenuBody(){
    return Container(
      color: BasicBackgroundColor,
      padding: EdgeInsets.all(basicPadding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildMenuAppBar(),
      body: _buildMenuBody(),
      drawer: SideMenu(),
    );
  }
}