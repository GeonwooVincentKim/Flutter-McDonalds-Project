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
  CategoryModel cate;

  @override
  void initState(){
    cate = Provider.of<ProviderCategory>(context, listen: false).category;
    // if(cate == null){
      // final List<CategoryModel> menu = Provider.of<ProviderCategory>(context, listen: false).categoryList.toList();
      // Get one item from menuID.
      // If menuID matches to menuList, then shows the category what the User selected.
      // cate = menu.firstWhere((menuTitle) => menuTitle.categoryID == widget.menuID);
    // }
    super.initState();
  }

  Widget _buildMenuAppBar(){
    return AppBar(
      title: Text(cate.name),
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
          // Get all items of list that match to CategoryList's type.
          List<MenuModel> menuList = [];
          menuList = menu.menuList.where((menu) => menu.type == cate.type).toList();

          return menuList.length == 0 || menuList.length == null ?
            Center(child: Text("NOO!!!")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: menuList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              itemBuilder: (context, index) => ListTileMenu(menuContents: menuList[index]),
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
