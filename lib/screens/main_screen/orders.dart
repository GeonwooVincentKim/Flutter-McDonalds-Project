import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/contents/contents_orders.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_menu.dart';
import 'package:provider/provider.dart';


class Orders extends StatefulWidget {
  final String title;
  Orders({@required this.title,});

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  FoodModel orderedMenu;
  String yourOrder = 'Previous Orders';
  String menuID;
  List<FoodModel> totalPrices = [];

  @override
  void initState(){
    orderedMenu = Provider.of<ProviderFood>(context, listen: false).menuDetail;
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
        child: Consumer<ProviderFood>(
          builder: (ctx, orderMenu, child){
            final Map<String, dynamic> orderFilter = Provider.of<FilterProvider>(context).orderFilters;
            final List<FoodModel> orderList = orderMenu.orderList.where((ordered) => checkFilter(ordered, orderFilter)).toList();
            // final List<FoodModel> orderList = orderMenu.orderList.toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ContentsOrder(title: yourOrder),
                // If cartList has the item, then shows ListView,
                // Otherwise, just show the text
                orderList.length != 0 ?
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => TransparentDivider(),
                  itemCount: orderList.length,
                  itemBuilder: (context, index) => ListTileMenu(menuContents: orderList[index])
                ) : Center(child: Text("No recent Order List")),
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