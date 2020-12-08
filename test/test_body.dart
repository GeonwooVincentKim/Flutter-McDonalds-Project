import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';

import 'test_sidemenu.dart';


class TestBody extends StatefulWidget {
  @override
  _TestBodyState createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  Widget _buildAppBar(){
    return AppBar(
      title: Text("Hi"),
      backgroundColor: Colors.black,
      // backgroundColor: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
      centerTitle: true,
      actions: [

      ],
    );
  }

  Widget _buildTestBody(){
    return Container(
      child: Text("Test..")
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildTestBody(),
      // drawer: SideMenu(),
      drawer: TestSideMenu(),
    );
  }
}