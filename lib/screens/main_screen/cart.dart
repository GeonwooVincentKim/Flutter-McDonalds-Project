import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/contents/contents_cart.dart';
import 'package:myTestApp_Test/widget/list_tile/cart_list.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_cart_item.dart';
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
            final List<MenuModel> subMenuList = orderMenu.cartList.toList();
            // final List<MenuModel> cartPage = subMenuList.toList();
            // return yourOrder.length == 0 || yourOrder.length == null ?
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     // CartItemListTile(title: yourOrder[0], menuList: cartPage),
            //     TransparentDivider(),
            //   ],
            // ) :
            // return Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     CartItemListTile(title: yourOrder[0], menuList: cartPage),
            //     TransparentDivider(),
            //   ],
            // );
            return subMenuList.length > 0 && subMenuList.length != 0?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContentsCart(title: yourOrder[0]),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => TransparentDivider(),
                  itemCount: subMenuList.length,
                  itemBuilder: (context, index) => CartList(orderMenu: subMenuList[index])
                )
              ]
            ) : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContentsCart(title: yourOrder[0]),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                // ListView.separated(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   separatorBuilder: (context, index) => TransparentDivider(),
                //   itemCount: subMenuList.length,
                //   itemBuilder: (context, index) => CartList(orderMenu: subMenuList[index])
                // )
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
            // return yourOrder.length == 0 || yourOrder.length == null ?
            // Column(
            //   children: [
            //     // Text(yourOrder[1].toUpperCase().toString(), style: menuTitleSize),
            //     TransparentDivider(),
            //     // Text("\￦${totalPrice.totalPrices}", style: costText),
            //     TransparentDivider(),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
            //         BottomButton(contents: "CANCEL", onPressed: () => _buildResetForm(context)),
            //         // RaisedButton(
            //         //   child: Text('Clear'),
            //         //   onPressed: () {
            //         //     setState(() {
            //         //       yourOrder.clear();
            //         //     });
            //         //   },
            //         // ),
            //       ]
            //     )
            //   ]
            // ) :
            return totalPrice.totalPrices > 0 || totalPrice.totalPrices != 0 ?
            Column(
              children: [
                // Text(yourOrder[1].toUpperCase().toString(), style: menuTitleSize),
                ContentsCart(title: yourOrder[1]),
                // TransparentDivider(),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                Text("\￦${totalPrice.totalPrices}", style: costText),
                TransparentDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
                    BottomButton(contents: "CANCEL", onPressed: () => _buildResetForm(context)),
                    // RaisedButton(
                    //   child: Text('Clear'),
                    //   onPressed: () {
                    //     setState(() {
                    //       yourOrder.clear();
                    //     });
                    //   },
                    // ),
                  ]
                )
              ]
            ) : 
            Column(
              children: [
                // Text(yourOrder[1].toUpperCase().toString(), style: menuTitleSize),
                ContentsCart(title: yourOrder[1]),
                // TransparentDivider(),
                Divider(height: basicPadding * 2, color: Colors.transparent),
                Text("\￦${totalPrice.totalPrices}", style: costText),
                TransparentDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
                    BottomButton(contents: "CANCEL", onPressed: () => _buildResetForm(context)),
                    // RaisedButton(
                    //   child: Text('Clear'),
                    //   onPressed: () {
                    //     setState(() {
                    //       yourOrder.clear();
                    //     });
                    //   },
                    // ),
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
    Provider.of<ProviderMenu>(context, listen: false).cartList;
    // Provider.of<ProviderMenu>(context, listen: false).addToCart(add);
    Navigator.pushNamed(context, "/orders");
    Provider.of<ProviderMenu>(context, listen: false).cartList.clear();
  }

  void _buildResetForm(BuildContext context){
    Provider.of<ProviderMenu>(context, listen: false).deleteOrderMenu(cartMenu);
    print(cartMenu);
  }
}