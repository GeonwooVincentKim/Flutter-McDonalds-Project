import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/shared/style/text.dart';
import 'package:provider/provider.dart';


class SubMenuTile extends StatelessWidget{
  final MenuModel subMenu;
  SubMenuTile({@required this.subMenu});

  Widget _buildSubMenuImage(){
    return Container(
      child: Image.asset(
        subMenu.image,
        fit: BoxFit.fill
      )
    );
  }

  Widget _buildSubMenuBody(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextDesign(
            basicText: subMenu.menuTitle,
            textStyle: mainListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: subMenu.prices.toString() + "KRW",
            textStyle: subListSize
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: subMenu.releaseDate.toString(),
            textStyle: subListSize
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<MainMenuProvider>(context, listen: false).mainMenuItems.toList());
    return Container(
      child: GestureDetector(
        onTap: () {
          Provider.of<MenuProvider>(context, listen: false).selectDetailMenu(subMenu);
          print('${subMenu.id}');
          Navigator.pushNamed(context, "/details/${subMenu.id}");
        },
        child: Card(
          child: Column(
            children: <Widget>[
              _buildSubMenuImage(),
              _buildSubMenuBody(context),
            ]
          )
        )
      ),
    );
  }
}