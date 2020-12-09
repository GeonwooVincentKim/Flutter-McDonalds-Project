import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/image_widget/positioned/positioned_image.dart';
import 'package:provider/provider.dart';


class Details extends StatefulWidget {
  // final Color backgroundColor;
  final String menuID;

  Details({
    // @required this.backgroundColor,
    @required this.menuID
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  MenuModel detailMenu;
  int countNum = 0;
  final _formDetailKey = GlobalKey<FormState>();

  @override
  void initState(){
    detailMenu = Provider.of<ProviderMenu>(context, listen: false).menu;
    if(detailMenu == null){
      final List<MenuModel> detailTitle = Provider.of<ProviderMenu>(context, listen: false).menuList.toList();
      detailMenu = detailTitle.firstWhere((menu) => menu.id == widget.menuID);
    }
    super.initState();
  }
  
  Widget _buildDetailAppBar(){
    return AppBar(
      title: Text(detailMenu.menuTitle),
      // backgroundColor: BasicAppBarColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(IconMoon.iadd), color: Colors.white,
          onPressed: () => _buildAlertTextForm(context),
          // onPressed: () => Navigator.pushNamed(context, "/cart"),
        )
      ],
    );
  }

  Widget _buildText(){
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: screenHeight / 1.5,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: <Widget>[
            Text(detailMenu.menuTitle, style: menuTitleSize, textAlign: TextAlign.center,),
            Text("${detailMenu.prices.toString()} KRW", style: detailTitleSize)
          ],
        )
      ),
    );
  }

  Widget _buildImage(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight / 1.5,
      // width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: basicPadding),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          PositionedImage(selection: 1, bottom: centerLength * 2, left: centerLength),
          PositionedImage(selection: 0, bottom: basicLength, left: centerLength * 2, imagePath: detailMenu.image),
        ],
      )
    );
  }

  Widget _buildDetailBody(){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _buildImage(context),
          _buildText(),
          _buildBottomButton(context),
        ]
      )
    );
  }

  Widget _buildBottomButton(BuildContext context){
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(basicPadding / 2),
          child: Text("Add to my Cart", style: clickTileSize)
        ),
        onPressed: () => _buildAlertTextForm(context),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDetailAppBar(),
      body: _buildDetailBody(),
      drawer: SideMenu(),
    );
  }

  void _buildAlertTextForm(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Add to the Cart", textAlign: TextAlign.center),
          shape: AlertBorder,
          content:  Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formDetailKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Do you want to order \n${detailMenu.menuTitle}\n into your Cart?", textAlign: TextAlign.center, ),
                  // Text("Please enter the Number of ${detailMenu.menuTitle} to order.", textAlign: TextAlign.center),
                  TransparentDivider(),
                  // TextFormField(
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(hintText: "Ex:) 1",),
                  //   onSaved: (_countNum) => countNum = int.parse(_countNum),
                  //   validator: (value){
                  //     if(value.isEmpty){return 'Please input the number of you selected';}
                  //     return null;
                  //   }
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomButton(contents: "OK", onPressed: () => _buildSubmitForm(context)),
                      BottomButton(contents: "CANCEL", onPressed: () => Navigator.of(context).pop())
                    ]
                  ),
                ],
              )
            ),
          ),
        );
      }
    );
  }

  void _buildSubmitForm(BuildContext context){
    if(!_formDetailKey.currentState.validate()) return;
    _formDetailKey.currentState.save();
    Provider.of<ProviderMenu>(context).addMenu(detailMenu);
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/cart");
  }
}