import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_category.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_menu.dart';
import 'package:provider/provider.dart';


class Category extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  Category({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
  });

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // List<MenuModel> categoryList = [];
  List<CategoryModel> categoryList = [];
  Widget _buildCategoryAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
    );
  }

  Widget _buildCategoryBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderCategory>(
        builder: (ctx, category, child){
          // final Map<String, dynamic> menuFilter = Provider.of<FilterProvider>(context).orderFilters;
          final List<CategoryModel> listCategory = category.categoryList.toList();
          // final MenuModel filter = Provider.of<FilterProvider>(context).changeOrderNoMapFilters(filter);
          // final List<MenuModel> listCategory = category.menuList;
          // final List<MenuModel> listMenu = menu.menuList.where((menu) => checkFilter(menu, ))
          categoryList = listCategory.toList();

          return listCategory.length == 0 ?
            Center(child: Text("NOO!!!")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: listCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              itemBuilder: (context, index) => ListTileCategory(cate: listCategory[index])
              // itemBuilder: (context, index) => ListTileMenu(menuContents: listMenu[index]),
            );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCategoryAppBar(),
      body: _buildCategoryBody(),
      drawer: SideMenu()
    );
  }
}