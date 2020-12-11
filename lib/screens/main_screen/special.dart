import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class Special extends StatefulWidget {
  final String title;
  Special({@required this.title});
  @override
  _SpecialState createState() => _SpecialState();
}

class _SpecialState extends State<Special> {
  Widget _buildSpecialAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
    );
  }

  Widget _buildSpecialBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding),
      child: Text("HI")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSpecialAppBar(),
      body: _buildSpecialBody(),
      drawer: SideMenu(),
    );
  }
}