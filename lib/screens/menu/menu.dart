import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
// import 'package:myTestApp/widget/main_menu_list.dart';
import 'package:myTestApp/widget/list_tile/main_menu_list_tile.dart';
import 'package:provider/provider.dart';


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
  List<MainMenuModel> mainPage = [];
  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.menuColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white,
          ), onPressed: () => Navigator.pushNamed(context, "/mainMenu/createMenu")
        )
      ],
    );
  }

  Widget _buildMenuBody(){
    return Container(
      // padding: EdgeInsets.all(basicPadding),
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      // margin: EdgeInsets.symmetric(vertical: basicMargin, horizontal: basicMargin),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<MainMenuProvider>(
        builder: (ctx, mainList, child){
          final List<MainMenuModel> listMainMenu = mainList.mainMenuItems;
          mainPage = listMainMenu.toList();

          return GridView.builder(
            shrinkWrap: true,
            itemCount: mainPage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 30.0,
            ),
            physics: ScrollPhysics(),
            // itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
            itemBuilder: (context, index) => MainMenuListTile(mainMenuTile: mainPage[index]),
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildMenuAppBar(),
      drawer: SideMenu(),
      body: _buildMenuBody(),
      backgroundColor: BasicBackgroundColor,
    );
  }
}