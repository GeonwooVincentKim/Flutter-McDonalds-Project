import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/widget/list_tile/submenu_list_tile.dart';
import 'package:myTestApp/widget/title/orders_title.dart';


class OrdersItemListTile extends StatelessWidget {
  final String title;
  final List<MenuModel> menuList;

  OrdersItemListTile({@required this.title, @required this.menuList});

  @override
  Widget build(BuildContext context) {
    return menuList.length > 0 ?
      Column(
        children: <Widget>[
          OrdersTitle(title: title),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => TransparentDivider(),
            itemCount: menuList.length,
            itemBuilder: (context, index) => SubMenuTile(subMenu: menuList[index],),
            // itemBuilder: (context, index) => OrdersList(orderMenu: menuList[index]),
          )
        ]
      ) : Container(
        child: OrdersTitle(title: title),
      );
  }
}