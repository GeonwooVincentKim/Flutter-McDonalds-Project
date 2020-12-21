import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down_date_format.dart';
import 'package:myTestApp_Test/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class CreateNewMenu extends StatefulWidget {
  final String title;
  CreateNewMenu({@required this.title});
  @override
  _CreateNewMenuState createState() => _CreateNewMenuState();
}

class _CreateNewMenuState extends State<CreateNewMenu> {
  final _formKey = GlobalKey<FormState>();
  List<MenuModel> menuContentList = [];

  List<String> mainMenuList = [];
  final List<String> year = [];
  final List<String> month = [];
  // MenuModel newMenu = MenuModel(id: null, menuTitle: null, image: null, prices: null, releaseYear: null, releaseMonth: null);
  Map<String, dynamic> newMenu = {
    'menuTitle': '',
    'image': '',
    'prices': '',
    'releaseYear': '',
    'releaseMonth': ''
  };
  @override
  void initState(){ 
    // newMenu = Provider.of<ProviderMenu>(context, listen: false).menu;
    // mainMenuList = menuContentList.map((mainMenu) => mainMenu.menuTitle).toList();    
    // MenuModel showMenu = Provider.of<ProviderMenu>(context, listen: false).selectedMenu;
    super.initState();
  }


  Widget _buildNewAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      // backgroundColor: BasicAppBarColor,
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
            onSaved: (String value){newMenu['menuTitle'] = value;}
            // onSaved: (String value){newMenu.menuTitle = value;},
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
            // onSaved: (String value) {newMenu.image = value;},
            onSaved: (String value){newMenu['image'] = value;}
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
            },
            onSaved: (String value) {newMenu['prices'] = int.parse(value);}
            // onSaved: (String value){newMenu.prices = int.parse(value);}
          )
          // _buildAddInfo(newMenuList[3], 3)
        ],
      )
    );
  }

  Widget _buildYearMonthList(){
    return DropDownDateFormat(
      yearmonthKey: _formKey,
      // menuModelYearMonth: newMenu
      menuYearMonthMap: newMenu,
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNewAppBar(),
      body: _buildNewBody(),
      drawer: SideMenu(),
    );
  }

  void _buildMenuForm(){
    if(!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    newMenu['releaseYearMonth'] = '${newMenu['releaseYear']}/${newMenu['releaseMonth']}';
    // Provider.of<ProviderMenu>(context).createSubMenu(newMenuList);
    Provider.of<ProviderMenu>(context).createMenu(newMenu);
    Navigator.pushNamed(context, "/");
  }
}