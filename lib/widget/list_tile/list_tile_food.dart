import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';
import 'package:provider/provider.dart';


class ListTileFood extends StatelessWidget{
  final FoodModel foodContents;
  ListTileFood({@required this.foodContents});

  Widget _buildMenuImage(){
    return Container(
      child: Image.asset(
        foodContents.image,
        fit: BoxFit.fill
      )
    );
  }

  Widget _buildMenuBody(BuildContext context){
    
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextDesign(
            basicText: foodContents.foodTitle,
            textStyle: mainListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: foodContents.prices.toString() + "KRW",
            textStyle: subListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: foodContents.releaseDate.toString(),
            textStyle: subListSize
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Provider.of<ProviderFood>(context, listen: false).selectMenu(foodContents);
          Navigator.pushNamed(context, "/detailFood/${foodContents.id}");
        },
        child: Card(
          child: Column(
            children: <Widget>[
              _buildMenuImage(),
              _buildMenuBody(context),
            ]
          )
        )
      )
    );
  }
}