import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:provider/provider.dart';

import 'package:myTestApp/widget/list_tile/edit_user_card_tile.dart';


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
          ), onPressed: () => _buildDetailMenuForm(),
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
                _buildMainMenuSelect(),
                _buildMenuTitle(),
                _buildImage(),
                _buildPrices(),
                _buildReleaseDate(),
              ]
            )
          )
        ),
      ),
    );
  }

  Widget _buildMainMenuSelect(){
    return DropdownMenuItem(
      
    );
  }
  
  Widget _buildMenuTitle(){
    return CardTile(
      child: Column(
        children: [
          Text("FirstName"),
          _buildAddInfo(newDetailMenu[1], 1)
        ],
      )
    );
  }

  Widget _buildImage(){
    return CardTile(
      child: Column(
        children: [
          Text("Image"),
          _buildAddInfo(newDetailMenu[2], 2)
        ],
      )
    );
  }

  Widget _buildPrices(){
    return CardTile(
      child: Column(
        children: [
          Text("Prices"),
          _buildAddInfo(newDetailMenu[3], 3)
        ],
      )
    );
  }

  Widget _buildReleaseDate(){
    return CardTile(
      child: Column(
        children: [
          Text("Release Date"),
          _buildAddInfo(newDetailMenu[4], 4)
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
      }, onSaved: (value) => newDetailMenu[index] = value,
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

  void _buildDetailMenuForm(){
    if(!_formDetailKey.currentState.validate()) return;
    _formDetailKey.currentState.save();
    Provider.of<MenuProvider>(context).createSubMenu(newDetailMenu);
    Navigator.pushNamed(context, "/");
  }
}