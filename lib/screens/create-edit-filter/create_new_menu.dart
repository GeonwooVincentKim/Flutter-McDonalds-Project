import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/list_tile/edit_user_card_tile.dart';
import 'package:provider/provider.dart';


class CreateNewMenu extends StatefulWidget {
  @override
  _CreateNewMenuState createState() => _CreateNewMenuState();
}

class _CreateNewMenuState extends State<CreateNewMenu> {
  final _formNewMainKey = GlobalKey<FormState>();
  List<String> newDetailMenu = ['menuTitle', 'image', 'prices'];
  List<String> newMenu = ['', '', ''];

  @override
  void initState(){
    // final MenuModel menuModel = Provider.of<MenuProvider>(context, listen: false).select
    // final MainMenuModel mainModel = Provider.of<MainMenuProvider>(context, listen: false).selectedMainMenu;
    // if(mainModel != null){
    //   newMenu[0] = mainModel.id;
    //   newMenu[1] = mainModel.foodName;
    //   newMenu[2] = mainModel.mainImage;
    // }
    super.initState();
  }

  Widget _buildNewMenuAppBar(){
    return AppBar(
      title: Text("Create New Menu"),
      centerTitle: true,
      backgroundColor: BasicAppBarColor,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white
          ), onPressed: () => _buildNewMenuForm(),
        )
      ],
    );
  }

  Widget _buildNewMenuBody(){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.all(basicPadding),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basicPadding * 2),
          child: Form(
            key: _formNewMainKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFoodName(),
                _buildMainImage(),
              ]
            )
          )
        ),
      ),
    );
  }

  Widget _buildFoodName(){
    return CardTile(
      child: Column(
        children: [
          Text("FirstName"),
          _buildAddInfo(newMenu[1], 1)
        ]
      )
    );
  }

  Widget _buildMainImage(){
    return CardTile(
      child: Column(
        children: [
          Text("MainImage"),
          _buildAddInfo(newMenu[2], 2)
        ],
      )
    );
  }

  Widget _buildAddInfo(String text, int index){
    return TextFormField(
      initialValue: text,
      validator: (value){
        if(value.isEmpty) return 'Please fill the ${'text'} in your blank';
        return null;
      }, onSaved: (value) => newMenu[index] = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNewMenuAppBar(),
      body: _buildNewMenuBody(),
      backgroundColor: BasicBackgroundColor,
      drawer: SideMenu(),
    );
  }

  void _buildNewMenuForm(){
    if(!_formNewMainKey.currentState.validate()) return;
    _formNewMainKey.currentState.save();
    Provider.of<MainMenuProvider>(context).createMain(newMenu);
    Navigator.pushNamed(context, "/");
  }
}