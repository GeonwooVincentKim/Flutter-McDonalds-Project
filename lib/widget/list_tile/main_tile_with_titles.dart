import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/widget/list_tile/main_menu_list_tile.dart';


class MainTileWithTitles extends StatelessWidget{
  final List<MainMenuModel> categoryList;
  MainTileWithTitles({@required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: categoryList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 30.0,
      ),
      itemBuilder: (context, index) => MainMenuListTile(mainMenuTile: categoryList[index])
    );
  }
}