import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/contents/contents_cart.dart';
import 'package:myTestApp_Test/widget/list_tile/cart_list.dart';
import 'package:provider/provider.dart';


class Cart extends StatefulWidget {
  final String title;
  Cart({@required this.title});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  MenuModel cartMenu;
  List<String> yourOrder = <String>['Your Orders', 'Total Prices'];
  String menuID;
  List<MenuModel> totalPrices = [];

  int sum = 0;

  @override
  void initState(){
    cartMenu = Provider.of<ProviderMenu>(context, listen: false).menuDetail;
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
            final List<MenuModel> cartList = orderMenu.cartList.toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContentsCart(title: yourOrder[0]),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                // If cartList has the item, then shows ListView,
                // Otherwise, just show the text
                cartList.length > 0 && cartList.length != 0 ?
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => TransparentDivider(),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) => CartList(orderMenu: cartList[index])
                ) : Center(child: Text("No Ordered List"))
              ]
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
                ContentsCart(title: yourOrder[1]),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                Text("\￦${totalPrice.totalPrices}", style: costText),
                TransparentDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
                    BottomButton(contents: "CANCEL", onPressed: () => _buildResetForm(context)),
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
    );
  }

  void _buildSubmitForm(BuildContext context){
    Provider.of<ProviderMenu>(context, listen: false).addToOrder(cartMenu);
    Navigator.pushNamed(context, "/orders");
  }

  void _buildResetForm(BuildContext context){
    Provider.of<ProviderMenu>(context, listen: false).deleteCartMenu(cartMenu);
    print(cartMenu);
  }
}