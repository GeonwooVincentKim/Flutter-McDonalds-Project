import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/widget/contents/contents_cart.dart';
import 'package:myTestApp_Test/widget/list_tile/cart_list.dart';


class CartItemListTile extends StatelessWidget {
  final String title;
  final List<MenuModel> menuList;

  CartItemListTile({@required this.title, @required this.menuList});

  @override
  Widget build(BuildContext context) {
    return menuList.length > 0 ?
      Column(
        children: <Widget>[
          ContentsCart(title: title),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => TransparentDivider(),
            itemCount: menuList.length,
            // itemBuilder: (context, index) => SubMenuTile(subMenu: menuList[index],),
            itemBuilder: (context, index) => CartList(orderMenu: menuList[index])
          )
        ]
      ) : Container(
        child: ContentsCart(title: title),
      );
  }
}