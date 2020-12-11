import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_home.dart';
import 'package:myTestApp_Test/provider/provider_home.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';
import 'package:provider/provider.dart';


class ListTileHome extends StatelessWidget{
  final ModelHome listHome;
  ListTileHome({@required this.listHome});

  Widget _buildImage(){
    return Container(
      child: Image.asset(
        listHome.homeImage,
        fit: BoxFit.fill
      )
    );
  }

  Widget _buildBody(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: listHome.homeTitle,
            textStyle: mainListSize
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Provider.of<ProviderHome>(context, listen: false).selectHomeMenu(listHome);
          Navigator.pushNamed(context, "/home/${listHome.homeID}");
        },
        child: Card(
          child: Column(
            children: [
              _buildImage(),
              _buildBody(context),
            ],
          )
        )
      ),
    );
  }
}