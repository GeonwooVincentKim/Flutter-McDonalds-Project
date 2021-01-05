import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_special.dart';
import 'package:provider/provider.dart';


class Special extends StatefulWidget {
  final String title;
  Special({@required this.title});
  @override
  _SpecialState createState() => _SpecialState();
}

class _SpecialState extends State<Special> {
  Widget _buildSpecialAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.ipencil,
            color: Theme.of(context).cardColor,
          ),
          onPressed: () => Navigator.pushNamed(context, "/mainMenu/createMenu")
        )
      ],
    );
  }

  Widget _buildSpecialBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderFood>(
        builder: (ctx, menu, child){
          // final Map<String, dynamic> specialFilter = Provider.of<FilterProvider>(context, listen: false).orderFilters;
          // FoodModel specialMenu = Provider.of<ProviderFood>(context, listen: false).selectedSpecialMenu;
          final List<FoodModel> listSpecial = menu.specialMenuList.toList();
          // specialList = listSpecial.toList();

          return listSpecial.length == 0 ?
            Center(child: Text("No List")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: listSpecial.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0,
              ),
              itemBuilder: (context, index) => ListTileSpecial(spMenuList: listSpecial[index])
            );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSpecialAppBar(),
      body: _buildSpecialBody(),
      drawer: SideMenu(),
    );
  }
}