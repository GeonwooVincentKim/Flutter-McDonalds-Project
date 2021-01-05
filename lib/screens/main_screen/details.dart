import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/image_widget/positioned/positioned_image.dart';
import 'package:provider/provider.dart';


class Details extends StatefulWidget {
  final String foodID;
  Details({@required this.foodID});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  FoodModel detailFood;
  int countNum = 0;
  final _formDetailKey = GlobalKey<FormState>();

  @override
  void initState(){
    detailFood = Provider.of<ProviderFood>(context, listen: false).menuDetail;
    if(detailFood == null){
      final List<FoodModel> detailTitle = Provider.of<ProviderFood>(context, listen: false).foodItemList.toList();
      detailFood = detailTitle.firstWhere((food) => food.id == widget.foodID);
    }
    super.initState();
  }

  Widget _buildDetailAppBar(){
    return AppBar(
      title: Text(detailFood.foodTitle),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(IconMoon.iadd), color: Colors.white,
          onPressed: () => _buildAlertTextForm(context),
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
            Text(detailFood.foodTitle, style: menuTitleSize, textAlign: TextAlign.center,),
            Text("${detailFood.prices.toString()} KRW", style: detailTitleSize)
          ],
        )
      ),
    );
  }

  Widget _buildImage(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight / 1.5,
      padding: EdgeInsets.symmetric(horizontal: basicPadding),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          PositionedImage(selection: 1, bottom: centerLength * 2, left: centerLength),
          PositionedImage(selection: 0, bottom: basicLength, left: centerLength * 2, imagePath: detailFood.image),
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
          shape: alertBorder,
          content:  Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formDetailKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Do you want to order \n${detailFood.foodTitle}\n into your Cart?", textAlign: TextAlign.center, ),
                  TransparentDivider(),
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
    Provider.of<ProviderFood>(context).addToCart(detailFood);
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "/cart");
  }
}