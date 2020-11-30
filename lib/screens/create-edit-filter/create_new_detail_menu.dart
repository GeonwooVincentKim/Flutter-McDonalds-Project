import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/create-edit-filter/create_new_detail_menu_form.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down_widget/drop_down_screen.dart';
import 'package:provider/provider.dart';

import 'package:myTestApp/widget/list_tile/edit_user_card_tile.dart';


class CreateNewDetailMenu extends StatefulWidget {
  @override
  _CreateNewDetailMenuState createState() => _CreateNewDetailMenuState();
}

class _CreateNewDetailMenuState extends State<CreateNewDetailMenu> {
  final _formDetailKey = GlobalKey<FormState>();
  List<MainMenuModel> mainMenuName = [];
  List<String> mainMenuList = [];
  String image = '';
  // final Map<String, dynamic> newDetailMenu = {
  //   'selectMenu': '',
  //   'menuTitle': '',
  //   'image': '',
  //   'prices': '',
  //   'releaseDateYear': '',
  //   'releaseDateMonth': '',
  // };
  MenuModel newDetailMenu = MenuModel(id: null, menuTitle: null, image: null, prices: null, releaseDate: null);
  // List<String> newDetailMenu = ['', '', '', '', '', '', '']; // for form of DetailMenu

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
    mainMenuName = Provider.of<MainMenuProvider>(context, listen: false).mainMenuItems;
    mainMenuList = mainMenuName.map((mainMenu) => mainMenu.foodName).toList();
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
                // id -> [0]
                _buildMainMenuSelect(), // [1]
                _buildMenuTitle(), // [2]
                _buildImage(), // [3]
                _buildPrices(), // [4]
                // CreateNewDetailMenuForm(
                //   formData: newDetailMenu,
                //   formKey: _formDetailKey,
                // ),
               // _buildReleaseDate(), // [5] ~ [6]
              ]
            )
          )
        ),
      ),
    );
  }

  Widget _buildMainMenuSelect(){
    return DropDownWidget(
      // value: newDetailMenu['selectMenu'],
      value: newDetailMenu.menuTitle,
      items: mainMenuList,
      onChanged: (String value){
        setState(() {
          // newDetailMenu['selectMenu'] = value;
          newDetailMenu.menuTitle = value;
        });
      },
    );
  }
  
  Widget _buildMenuTitle(){
    return CardTile(
      child: Column(
        children: [
          Text("FirstName"),
          TextFormField(
            // initialValue: newDetailMenu['menuTitle'],
            initialValue: newDetailMenu.menuTitle,
            validator: (value){
              if(value.isEmpty) return 'Please fill the ${'menuTitle'} in your blank';
              return null;
            }, 
            // onSaved: (value) => newDetailMenu['menuTitle'] = value,
            onSaved: (value) => newDetailMenu.menuTitle = value
          )
          // _buildAddInfo(newDetailMenu[2], 2)
        ],
      )
    );
  }

  Widget _buildImage(){
    return CardTile(
      child: Column(
        children: [
          Text("Image"),
          TextFormField(
            // initialValue: newDetailMenu['image'],
            initialValue: newDetailMenu.image,
            // onSaved: (value) => newDetailMenu['image'] = value,
            onSaved: (value) => newDetailMenu.image = value
          )
        ],
      )
    );
  }

  Widget _buildPrices(){
    return CardTile(
      child: Column(
        children: [
          Text("Prices"),
          TextFormField(
            // initialValue: newDetailMenu['prices'],
            // initialValue: newDetailMenu.prices,
            validator: (value){
              if(value.isEmpty) return 'Please fill the ${'prices'} in your blank';
              return null;
            }, onSaved: (value) => newDetailMenu.prices = int.parse(value),
          )
        ],
      )
    );
  }

  Widget _buildReleaseDate(){
    return CardTile(
      child: Column(
        children: [
          Text("Release Date"),
          TextFormField(
            // initialValue: newDetailMenu['menuTitle'],
            validator: (value){
              if(value.isEmpty) return 'Please fill the ${'menuTitle'} in your blank';
              return null;
            }, 
            // onSaved: (value) => newDetailMenu['menuTitle'] = value,
            onSaved: (value) => newDetailMenu.releaseDate = value,
          )
        ],
      )
    );
  }

  // Widget _buildAddInfo(String text, int index){
  //   return TextFormField(
  //     initialValue: text,
  //     validator: (value){
  //       if(value.isEmpty) return 'Please fill the ${'text'} in your blank';
  //       return null;
  //     }, onSaved: (value) => newDetailMenu[index] = value,
  //   );
  // }
  
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
    // final MainMenuModel mainMenu = mainMenuList.singleWhere((mainMenu) => mainMenu.foodName == newDetailMenu[1]);
    // newDetailMenu['selectMenu'] = mainMenu.id;

    // Provider.of<MenuProvider>(context).createDetailMenu(newDetailMenu);
    Provider.of<MenuProvider>(context).createSubMenu(newDetailMenu);
    Navigator.pushNamed(context, "/");
  }
}