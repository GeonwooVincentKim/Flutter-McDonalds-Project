import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sub_menu/sub_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:provider/provider.dart';


class MainMenuListTile extends StatelessWidget{
  final MainMenuModel mainMenuTile;
  final int index;
  MainMenuListTile({@required this.mainMenuTile, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<MainMenuProvider>(context, listen: false).selectMainMenu(mainMenuTile);
        // Provider.of<MenuProvider>(context, listen: false).selectDetailMenu(mainMenuTile);
        // Route route = MaterialPageRoute(builder: (context) => DetailMenu());
        // Navigator.push(context, route);
        print('${mainMenuTile.id}');
        Navigator.pushNamed(context, "/food/${mainMenuTile.id}");
        // Navigator.pushNamed(context, "/food/${mainMenuTile.id}", arguments: MainMenuModel(type: mainMenuTile.type.length));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            _buildMainMenuImage(),
            _buildMainMenuText(context),
          ]
        ),
      )
    );
  }

  Widget _buildMainMenuText(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.symmetric(vertical: basicPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            mainMenuTile.foodName,
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style: mainListSize,
          )
        ],
      ),
    );
  }

  Widget _buildMainMenuImage(){
    return Container(
      child: Image.asset(
        mainMenuTile.mainImage,
        fit: BoxFit.fill,
      ),
    );
  }
  
}