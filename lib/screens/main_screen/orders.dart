import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_order_items.dart';
import 'package:provider/provider.dart';


class Orders extends StatefulWidget {
  final String title;
  Orders({@required this.title,});

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
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.ifilter,
            color: Theme.of(context).cardColor
          ),
          onPressed: () => Navigator.pushNamed(context, "/filter", arguments: "orders"),
        ),
        // IconButton(
        //   icon: Icon(
        //     IconMoon.iedit,
        //     color: Theme.of(context).cardColor
        //   ),
        //   onPressed: () => _buildOrdersReset(context),
        // )
      ]
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
            final Map<String, dynamic> orderFilter = Provider.of<FilterProvider>(context).orderFilters;
            final List<MenuModel> subMenuList = orderMenu.cartList.where((ordered) => checkFilter(ordered, orderFilter)).toList();
            // final List<MenuModel> subMenuList = orderMenu.cartList;
            // final List<MenuModel> cartPage = subMenuList.toList();

            return subMenuList.length == 0 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OrdersItemListTile(title: yourOrder, menuList: subMenuList),
                  TransparentDivider(),
                ],
              ) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OrdersItemListTile(title: yourOrder, menuList: subMenuList),
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

  void _buildOrdersReset(BuildContext context){
    Provider.of<ProviderMenu>(context).deleteCartMenu(totalPrices);
    print(totalPrices);
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