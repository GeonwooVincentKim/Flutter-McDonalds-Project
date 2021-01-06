import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/helpers/icomoon.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down_date_format.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down_date_format_map.dart';
import 'package:myTestApp_Test/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class CreateNewFood extends StatefulWidget {
  final String title;
  CreateNewFood({@required this.title});
  @override
  _CreateNewFoodState createState() => _CreateNewFoodState();
}

class _CreateNewFoodState extends State<CreateNewFood> {
  final _formKey = GlobalKey<FormState>();
  List<FoodModel> menuContentList = [];

  List<String> mainMenuList = [];
  final List<String> year = [];
  final List<String> month = [];
  // FoodModel newFood = FoodModel(id: null, menuTitle: null, image: null, prices: null, releaseYear: null, releaseMonth: null);
  Map<String, dynamic> newFood = {
    'foodTitle': '',
    'image': '',
    'prices': '',
    'releaseYear': '',
    'releaseMonth': '',
    'releaseDay': ''
  };
  @override
  void initState(){
    // newFood = Provider.of<ProviderMenu>(context, listen: false).menu;
    // mainMenuList = menuContentList.map((mainMenu) => mainMenu.menuTitle).toList();    
    // FoodModel showMenu = Provider.of<ProviderMenu>(context, listen: false).selectedMenu;
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
            onSaved: (String value){newFood['foodTitle'] = value;}
            // onSaved: (String value){newFood.menuTitle = value;},
          )
          // _buildAddInfo(newFoodList[1], 1)
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
            // onSaved: (String value) {newFood.image = value;},
            onSaved: (String value){newFood['image'] = value;}
          )
          // _buildAddInfo(newFoodList[2], 2)
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
            onSaved: (String value) {newFood['prices'] = int.parse(value);}
            // onSaved: (String value){newFood.prices = int.parse(value);}
          )
          // _buildAddInfo(newFoodList[3], 3)
        ],
      )
    );
  }

  Widget _buildYearMonthList(){
    // return DropDownDateFormatMap(
    //   yearmonthKey: _formKey,
    //   menuYearMonthMap: newFood,
    // );
    return DropDownDateFormat(
      yearmonthKey: _formKey,
      // menuModelYearMonth: newFood
      foodYearMonthMap: newFood,
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

    final String month = formatNumberForDate(int.parse(newFood['releaseMonth']));
    final String day = formatNumberForDate(int.parse(newFood['releaseDay']));
    newFood['releaseYearMonth'] = '${newFood['releaseYear']}/$month/$day';
    // Provider.of<ProviderMenu>(context).createSubMenu(newFoodList);
    Provider.of<ProviderFood>(context).createMenu(newFood);
    Navigator.pushNamed(context, "/");
  }
}