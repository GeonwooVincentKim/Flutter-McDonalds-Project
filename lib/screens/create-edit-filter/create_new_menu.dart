import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down.dart';
import 'package:myTestApp/widget/drop_down/drop_down_date_format.dart';
import 'package:myTestApp/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class CreateNewMenu extends StatefulWidget {
  @override
  _CreateNewMenuState createState() => _CreateNewMenuState();
}

class _CreateNewMenuState extends State<CreateNewMenu> {
  final _formDetailKey = GlobalKey<FormState>();
  // List<String> newDetailMenuList = ['', '', '', '', '', ''];
  List<MenuModel> newMenu = [];

  List<String> mainMenuList = [];
  final List<String> year = [];
  final List<String> month = [];
  MenuModel newDetailMenu = MenuModel(id: null, menuTitle: null, image: null);

  @override
  void initState(){
    newMenu = Provider.of<MenuProvider>(context, listen: false).menuList;
    mainMenuList = newMenu.map((mainMenu) => mainMenu.menuTitle).toList();    
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
                _buildMenuListSelect(),
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

  Widget _buildMenuListSelect(){
    return DropDownWidget(
      value: newDetailMenu.menuTitle,
      // value: mainMenuList[0],
      // value: newDetailMenuList[1],
      // value: newMenu,
      items: mainMenuList,
      onChanged: (String value){
        setState(() {
          // newDetailMenuList[1] = value;
          newDetailMenu.menuTitle = value;
          // newMenu
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
            validator: (value){
              if(value.isEmpty) return 'Please input any text';
              return null;
            }, 
            // onSaved: (String value){newDetailMenuList[2] = value;}
            onSaved: (String value){newDetailMenu.menuTitle = value;},
          )
          // _buildAddInfo(newDetailMenuList[1], 1)
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
            onSaved: (String value) {newDetailMenu.image = value;},
            // onSaved: (String value){newDetail}
          )
          // _buildAddInfo(newDetailMenuList[2], 2)
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
            }, onSaved: (String value){newDetailMenu.prices = int.parse(value);}
          )
          // _buildAddInfo(newDetailMenuList[3], 3)
        ],
      )
    );
  }

  Widget _buildYearMonthList(){
    return DropDownDateFormat(
      yearmonthKey: _formDetailKey,
      menuModelYearMonth: newDetailMenu
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

    // Provider.of<MenuProvider>(context).createSubMenu(newDetailMenuList);
    Provider.of<MenuProvider>(context).createDetailMenu(newDetailMenu);
    Navigator.pushNamed(context, "/");
  }
}