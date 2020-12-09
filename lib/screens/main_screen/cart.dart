import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_cart_item.dart';
import 'package:provider/provider.dart';


class Cart extends StatefulWidget {
  final String title;
  // final Color cartColor;

  Cart({
    @required this.title,
    // @required this.cartColor  
  });

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // String yourOrder = 'Your Orders';
  List<String> yourOrder = <String>['Your Orders', 'Total Prices'];
  String menuID;
  List<MenuModel> totalPrices = [];

  int sum = 0;

  @override
  void initState(){
    super.initState();
  }

  Widget _buildCartAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
    );
  }

  Widget _buildCartOrderList(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2,
      padding: EdgeInsets.symmetric(horizontal: basicPadding, vertical: basicPadding),
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Consumer<ProviderMenu>(
          builder: (ctx, orderMenu, child){
            final List<MenuModel> subMenuList = orderMenu.cartList;
            final List<MenuModel> cartPage = subMenuList.toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CartItemListTile(title: yourOrder[0], menuList: cartPage),
                TransparentDivider(),
              ],
            );
          }
        )
      )
    );
  }


  Widget _buildCartPurchase(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: basicPadding, vertical: basicPadding),
      color: Theme.of(context).primaryColor,
      child: Consumer<ProviderMenu>(
          builder: (ctx, totalPrice, child){
            return Column(
              children: [
                Text(yourOrder[1].toUpperCase().toString(), style: menuTitleSize),
                TransparentDivider(),
                Text("\￦${totalPrice.totalPrices}", style: costText),
                TransparentDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
                    BottomButton(contents: "CANCEL", onPressed: () => Navigator.of(context).pop()),
                  ]
                )
              ]
            );
          }
        )
    );
  }

  Widget _buildCartBody(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildCartOrderList(context),
          _buildCartPurchase(context),
        ]
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCartAppBar(),
      drawer: SideMenu(),
      body: _buildCartBody(context),
      // backgroundColor: BasicBackgroundColor,
    );
  }

  void _buildSubmitForm(BuildContext context){
    Provider.of<ProviderMenu>(context, listen: false).cartList;
    Navigator.pushNamed(context, "/orders");
  }
}