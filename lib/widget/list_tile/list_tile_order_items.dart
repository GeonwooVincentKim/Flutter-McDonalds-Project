import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/widget/contents/contents_orders.dart';
import 'package:myTestApp/widget/list_tile/list_tile_menu.dart';


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
            itemBuilder: (context, index) => ListTileMenu(menuContents: menuList[index]),
            // itemBuilder: (context, index) => OrdersList(orderMenu: menuList[index]),
          )
        ]
      ) : Container(
        child: ContentsOrder(title: title),
      );
  }
}