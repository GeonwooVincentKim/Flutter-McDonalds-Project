import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/provider/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down_date_format.dart';
import 'package:myTestApp/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class CreateNewMenu extends StatefulWidget {
  @override
  _CreateNewMenuState createState() => _CreateNewMenuState();
}

class _CreateNewMenuState extends State<CreateNewMenu> {
  final _formKey = GlobalKey<FormState>();
  // List<String> newMenuList = ['', '', '', '', '', ''];
  List<MenuModel> menuContentList = [];

  List<String> mainMenuList = [];
  final List<String> year = [];
  final List<String> month = [];
  MenuModel newMenu = MenuModel(id: null, menuTitle: null, image: null, prices: null, releaseYear: null, releaseMonth: null);

  @override
  void initState(){
    // newMenu = Provider.of<ProviderMenu>(context, listen: false).menu;
    // mainMenuList = menuContentList.map((mainMenu) => mainMenu.menuTitle).toList();    
    super.initState();
  }


  Widget _buildNewAppBar(){
    return AppBar(
      title: Text(" Menu"),
      centerTitle: true,
      backgroundColor: BasicAppBarColor,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white,
          ), onPressed: () => _buildMenuForm(),
        )
      ],
    );
  }

  Widget _buildNewBody(){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.all(basicPadding * 2),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basicPadding * 2),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuTitle(),
                _buildImage(),
                _buildPrices(),
                _buildYearMonthList(),
                // _buileReleaseDate(),
                // _buileReleaseYear(),
                // _buildReleaseDate(),
              ]
            )
          )
        ),
      ),
    );
  }

  Widget _buildMenuTitle(){
    return CardTile(
      child: Column(
        children: [
          Text("FirstName"),
          TextFormField(
            validator: (value){
              if(value.isEmpty) return 'Please input any text';
              return null;
            }, 
            // onSaved: (String value){newMenuList[2] = value;}
            onSaved: (String value){newMenu.menuTitle = value;},
          )
          // _buildAddInfo(newMenuList[1], 1)
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
            onSaved: (String value) {newMenu.image = value;},
            // onSaved: (String value){new}
          )
          // _buildAddInfo(newMenuList[2], 2)
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
            validator: (value){
              if(value.isEmpty) return 'Please input the number of costs';
              return null;
            }, onSaved: (String value){newMenu.prices = int.parse(value);}
          )
          // _buildAddInfo(newMenuList[3], 3)
        ],
      )
    );
  }

  Widget _buildYearMonthList(){
    return DropDownDateFormat(
      yearmonthKey: _formKey,
      menuModelYearMonth: newMenu
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNewAppBar(),
      body: _buildNewBody(),
      backgroundColor: BasicBackgroundColor,
      drawer: SideMenu(),
    );
  }

  void _buildMenuForm(){
    if(!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    // Provider.of<ProviderMenu>(context).createSubMenu(newMenuList);
    Provider.of<ProviderMenu>(context).createMenu(newMenu);
    print(newMenu.id);
    Navigator.pushNamed(context, "/");
  }
}