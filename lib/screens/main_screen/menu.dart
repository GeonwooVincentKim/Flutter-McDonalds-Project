import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/provider/provider_filter.dart';
import 'package:myTestApp/provider/provider_menu.dart';
import 'package:myTestApp/screens/create-edit-filter/filter.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/functions.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/list_tile/list_tile_menu.dart';
import 'package:provider/provider.dart';


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
  List<MenuModel> mainPage = [];
  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(widget.title),
      backgroundColor: BasicAppBarColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushNamed(context, "/food"),
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
          
          // final MenuModel filter = Provider.of<FilterProvider>(context).changeOrderNoMapFilters(filter);
          final List<MenuModel> listMenu = menu.menuList;
          // final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, ))
          mainPage = listMenu.toList();

          return GridView.builder(
            shrinkWrap: true,
            itemCount: mainPage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 30.0
            ),
            itemBuilder: (context, index) => ListTileMenu(menuContents: mainPage[index]),
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
      backgroundColor: BasicBackgroundColor
    );
  }
}