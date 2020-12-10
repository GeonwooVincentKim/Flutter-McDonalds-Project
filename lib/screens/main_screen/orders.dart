import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_order_items.dart';
import 'package:provider/provider.dart';


class Orders extends StatefulWidget {
  final String title;
  // final Color ordersColor;

  Orders({
    @required this.title,
    // @required this.ordersColor  
  });

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String yourOrder = 'Previous Orders';
  String menuID;
  List<MenuModel> totalPrices = [];

  @override
  void initState(){
    super.initState();
  }

  Widget _buildOrdersAppBar(){
    return AppBar(
      title: Text("Orders"),
      centerTitle: true,
    );
  }

  Widget _buildOrdersOrderList(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight / 1.2,
      padding: EdgeInsets.symmetric(horizontal: basicPadding, vertical: basicPadding),
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Consumer<ProviderMenu>(
          builder: (ctx, orderMenu, child){
            final List<MenuModel> subMenuList = orderMenu.cartList;
            final List<MenuModel> cartPage = subMenuList.toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OrdersItemListTile(title: yourOrder, menuList: cartPage),
                TransparentDivider(),
              ],
            );
          }
        )
      )
    );
  }

  Widget _buildOrdersBody(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding),
      child: SingleChildScrollView(
        child: _buildOrdersOrderList(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildOrdersAppBar(),
      drawer: SideMenu(),
      body: _buildOrdersBody(context),
    );
  }
}