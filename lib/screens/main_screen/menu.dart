import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
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
  CategoryModel categoryList;

  @override
  void initState(){
    // If the title of category is null, get the ID values from 'widget.menuID',
    // and substitude it which are already comparsed to the 'menu.categoryID'.
    categoryList = Provider.of<ProviderCategory>(context, listen: false).category;
    if(categoryList == null){
      final List<CategoryModel> menuList = Provider.of<ProviderCategory>(context, listen: false).categoryList.toList();
      // Comparse values, and then if it's right, then substitude the values of 'widget.menuID'
      // into 'menu.categoryID'.
      categoryList = menuList.firstWhere((menu) => menu.categoryID == widget.menuID);
    }
    super.initState();
  }

  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(categoryList.name),
      centerTitle: true,
    );
  }

  Widget _buildMenuBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderMenu>(
        builder: (ctx, menu, child){
          // final Map<String, dynamic> menuFilter = Provider.of<FilterProvider>(context).orderFilters;
          // Comparse
          List<MenuModel> listMenu = [];
          listMenu = menu.menuList.where((submenu) => submenu.type == categoryList.type).toList();

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
