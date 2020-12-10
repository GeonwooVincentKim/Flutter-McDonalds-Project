import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/widget/contents/contents_orders.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_menu.dart';


class OrdersItemListTile extends StatelessWidget {
  final String title;
  final List<MenuModel> menuList;

  OrdersItemListTile({@required this.title, @required this.menuList});

  @override
  Widget build(BuildContext context) {
    return menuList.length > 0 ?
      Column(
        children: <Widget>[
          ContentsOrder(title: title),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => TransparentDivider(),
            itemCount: menuList.length,
            itemBuilder: (context, index) => ListTileMenu(menuContents: menuList[index])
          )
        ]
      ) : Container(
        child: ContentsOrder(title: title),
      );
  }
}