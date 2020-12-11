import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_home.dart';
import 'package:myTestApp_Test/provider/provider_home.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_home.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  // This page will going to be use as a Special-Menu.
  // Special-Menu has the features that a User or Administrator
  // can add several menus what they want.

  // You also have to create Dummy-menu for Special-Menu,
  // but not to difficult.
  Home({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
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
    );
  }

  Widget _buildHomeAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
    );
  }

  Widget _buildHomeBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderHome>(
        builder: (ctx, home, child){
          final List<ModelHome> listHome = home.homeContent;
          return listHome.length == 0 ?
            Center(child: Text("No List")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: listHome.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              itemBuilder: (context, index) => ListTileHome(listHome: listHome[index])
          );
        }
      )
    );
  }
}