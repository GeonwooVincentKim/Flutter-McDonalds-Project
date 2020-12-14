import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_menu.dart';
import 'package:provider/provider.dart';


class Menu extends StatefulWidget {
  final String menuID;
  Menu({@required this.menuID});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // MenuModel categoryTypes;
  CategoryModel categoryTypes;

  @override
  void initState(){
    // categoryTypes = Provider.of<ProviderMenu>(context, listen: false).menuDetail;
    categoryTypes = Provider.of<ProviderCategory>(context, listen: false).category;
    if(categoryTypes == null){
      final List<CategoryModel> menuTitle = Provider.of<ProviderCategory>(context, listen: false).categoryList.toList();
      // final List<MenuModel> menuTitle = Provider.of<ProviderMenu>(context, listen: false).menuList;
      categoryTypes = menuTitle.firstWhere((menu) => menu.categoryID == widget.menuID);
    }else{
      // categoryTypes = Provider.of<ProviderMenu>(context, listen: false).menuDetail;
      print("Does Does Does Does");
    }
    super.initState();
  }

  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(categoryTypes.name),
      centerTitle: true,
      actions: [
        // IconButton(
        //   icon: Icon(
        //     IconMoon.iadd,
        //     color: Theme.of(context).cardColor
        //   ),
        //   onPressed: () => Navigator.pushNamed(context, "/mainMenu/createMenu", arguments: "menu"),
        // ),
        // IconButton(
        //   icon: Icon(
        //     IconMoon.ifilter,
        //     color: Theme.of(context).cardColor
        //   ),
        //   onPressed: () => Navigator.pushNamed(context, "/filter", arguments: "menu"),
        // )
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
          // final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, menuFilter)).toList();
          // final MenuModel filter = Provider.of<FilterProvider>(context).changeOrderNoMapFilters(filter);
          // MenuModel categoryMenu = Provider.of<ProviderMenu>(context, listen: false).selectedCategory;
          CategoryModel categoryMenu = Provider.of<ProviderCategory>(context, listen: false).category;
          print(categoryMenu.name);
          // List<MenuModel> listMenu = categoryMenu.childList;
          List<MenuModel> listMenu = [];

          if(categoryMenu.categoryID == 'ham'){
            listMenu = menu.menuHam;
          }else if (categoryMenu.categoryID == 'cafe'){
            listMenu = menu.menuCafe;
          }else if(categoryMenu.categoryID == 'morning'){
            listMenu = menu.menuMorning;
          }else if(categoryMenu.categoryID == 'dessert'){
            listMenu = menu.menuDessert;
          }
          // final List<MenuModel> listMenu = menu.menuList.toList();
          // final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, ))
          // mainPage = listMenu.toList();
          print(listMenu);
          return listMenu.length == 0 || listMenu.length == null ?
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