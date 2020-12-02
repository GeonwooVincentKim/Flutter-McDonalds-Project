import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_category.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
} 

class _CreateCategoryState extends State<CreateCategory> {
  final _formNewMainKey = GlobalKey<FormState>();
  // List<String> newDetailMenu = ['', '', ''];
  Category newMenu = Category(id: null, foodName: null, mainImage: null);
  List<String> newMenuList = ['', '', ''];

  @override
  void initState(){
    // final MenuModel menuModel = Provider.of<MenuProvider>(context, listen: false).select
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
          TextFormField(            
            validator: (value){
              if(value.isEmpty) return 'Please fill the ${'text'} in your blank';
              return null;
            }, 
            // onSaved: (String value){newMenuList[1] = value;}
            onSaved: (String value) { newMenu.foodName = value;},
          )
        ]
      )
    );
  }

  Widget _buildMainImage(){
    return CardTile(
      child: Column(
        children: [
          Text("MainImage"),
          TextFormField(            
            // onSaved: (String value){newMenuList[2] = value;}
            onSaved: (String value) { newMenu.mainImage = value;}
          )
        ],
      )
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
    Provider.of<MenuProvider>(context).createMainMenu(newMenu);
    print(newMenu);
    Navigator.pushNamed(context, "/");
  }
}