import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';
import 'package:provider/provider.dart';


class ListTileMenu extends StatelessWidget{
  final FoodModel menuContents;
  ListTileMenu({@required this.menuContents});

  Widget _buildMenuImage(){
    return Container(
      child: Image.asset(
        menuContents.image,
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
            basicText: menuContents.menuTitle,
            textStyle: mainListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: menuContents.prices.toString() + "KRW",
            textStyle: subListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: menuContents.releaseDate.toString(),
            textStyle: subListSize
          )
          // TextDesign(
          //   basicText: menuContents.releaseYear.toString() + "/"
          //   + menuContents.releaseMonth.toString(),
          //   textStyle: subListSize
          // ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Provider.of<ProviderMenu>(context, listen: false).selectMenu(menuContents);
          Navigator.pushNamed(context, "/detail/${menuContents.id}");
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