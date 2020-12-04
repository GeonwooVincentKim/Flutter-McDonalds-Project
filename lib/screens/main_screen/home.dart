import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';


class Home extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;
  final Color homeColor;

  Home({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo,
    @required this.homeColor
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: _buildHomeAppBar(),
      body: _buildHomeBody(),
      backgroundColor: BasicBackgroundColor,
    );
  }

  Widget _buildHomeAppBar(){
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.homeColor,
      centerTitle: true,
    );
  }

  Widget _buildHomeBody(){
    return Container(
      color: BasicBackgroundColor,
      padding: EdgeInsets.all(basicPadding),
      child: SingleChildScrollView(
        // It doesn't need to use Stack. You can change anything
        // What you want.
        // child: Conumser<MenuModel>(
        //   builder: (context, menuList, child) => Stack(
        //     children: [
        //       
        //     ]
        //   )
        // );
        child: Column(
          children: <Widget>[
            
          ]
        ),
      ),
    );
  }
}