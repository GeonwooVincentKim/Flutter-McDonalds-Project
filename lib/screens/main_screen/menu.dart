import 'package:flutter/material.dart';
import 'package:myTestApp/widget/style/style.dart';


class Menu extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;
  final Color menuColor;

  Menu({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo,
    @required this.menuColor
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

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}