import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:provider/provider.dart';


class CreateNewDetailMenu extends StatefulWidget {
  @override
  _CreateNewDetailMenuState createState() => _CreateNewDetailMenuState();
}

class _CreateNewDetailMenuState extends State<CreateNewDetailMenu> {
  final _formDetailKey = GlobalKey<FormState>();
  List<String> newDetailMenu = ['', '', '', '', '', ''];

  @override
  void initState(){
    // final MenuModel detailMenu = Provider.of<MenuProvider>(context, listen: false).subMenu;
    // if(detailMenu != null){
    //   newDetailMenu[0] = detailMenu.id;
    //   newDetailMenu[1] = detailMenu.menuTitle;
    //   newDetailMenu[2] = detailMenu.image;
    //   newDetailMenu[3] = detailMenu.prices.toString();
    //   newDetailMenu[4] = detailMenu.releaseDate.toString();
    // }
    super.initState();
  }


  Widget _buildNewDetailAppBar(){
    return AppBar(
      title: Text("Detail Menu"),
      centerTitle: true,
      backgroundColor: BasicAppBarColor,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white,
          ), onPressed: () => _buildDetailCreate(),
        )
      ],
    );
  }

  Widget _buildNewDetailBody(){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.all(basicPadding * 2),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basicPadding * 2),
          child: Form(
            key: _formDetailKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // _buildMenuTitle(),
                // _buildImage(),
                // _buildPrices(),
                // _buildReleaseDate(),
              ]
            )
          )
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNewDetailAppBar(),
      body: _buildNewDetailBody(),
      backgroundColor: BasicBackgroundColor,
      drawer: SideMenu(),
    );
  }

  void _buildDetailCreate(){

  }
}