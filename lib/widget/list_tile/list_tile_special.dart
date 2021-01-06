import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';
import 'package:provider/provider.dart';


class ListTileSpecial extends StatelessWidget{
  final FoodModel spFoodList;
  ListTileSpecial({@required this.spFoodList});

  // If there is no name of image, then shows the 'McDonaldsLogo.jpg' file.
  Widget _displayMedia(String media){
      if(media == null || media == "") {
        return Image.asset('assets/basicimages/McDonaldsLogo.jpg', fit : BoxFit.fill);
      } else {
        return Image.asset(media, fit : BoxFit.fill);
      }
  }
  Widget _buildSpecialImage() => Container(child: _displayMedia(spFoodList.image));
  Widget _buildSpecialBody(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextDesign(
            basicText: spFoodList.foodTitle,
            textStyle: mainListSize
          ),
          Divider(height: 10, color: Colors.transparent),
          TextDesign(
            basicText: spFoodList.prices.toString() + "KRW",
            textStyle: subListSize
          ),
          Divider(height: 10, color: Colors.transparent),
          TextDesign(
            basicText: spFoodList.releaseDate.toString(),
            textStyle: subListSize
          )
          // TextDesign(
          //   basicText: spMenuList.releaseYear.toString() + "/"
          //     + spMenuList.releaseMonth.toString(),
          //   textStyle: subListSize
          // ),
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Provider.of<ProviderFood>(context, listen: false).selectMenu(spFoodList);
          Navigator.pushNamed(context, "/specialFood/${spFoodList.id}");
        },
        child: Card(
          child: Column(
            children: [
              _buildSpecialImage(),
              _buildSpecialBody(context),
            ]
          )
        )
      ),
    );
  }
}