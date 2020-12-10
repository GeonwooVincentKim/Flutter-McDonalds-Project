import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_menu.dart';
import 'package:provider/provider.dart';


class Menu extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  Menu({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo,
  });
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuModel> mainPage = [];
  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Theme.of(context).cardColor
          ),
          onPressed: () => Navigator.pushNamed(context, "/mainMenu/createMenu", arguments: "menu"),
        ),
        IconButton(
          icon: Icon(
            IconMoon.ifilter,
            color: Theme.of(context).cardColor
          ),
          onPressed: () => Navigator.pushNamed(context, "/filter", arguments: "menu"),
        )
      ],
    );
  }

  Widget _buildMenuBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderMenu>(
        builder: (ctx, menu, child){
          final Map<String, dynamic> menuFilter = Provider.of<FilterProvider>(context).orderFilters;
          final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, menuFilter)).toList();
          // final MenuModel filter = Provider.of<FilterProvider>(context).changeOrderNoMapFilters(filter);
          // final List<MenuModel> listMenu = menu.menuList;
          // final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, ))
          // mainPage = listMenu.toList();

          return listMenu.length == 0 ?
            Center(child: Text("NOO!!!")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: listMenu.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              itemBuilder: (context, index) => ListTileMenu(menuContents: listMenu[index]),
            );
        }
      )
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