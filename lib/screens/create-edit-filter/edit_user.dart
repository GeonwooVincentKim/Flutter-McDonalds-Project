import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_user.dart';
import 'package:myTestApp/provider/provider_user.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/list_tile/card_tile_edit_user.dart';
import 'package:provider/provider.dart';


class EditUser extends StatefulWidget {
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formEditKey = GlobalKey<FormState>();
  List<String> userInform = ['firstName', 'lastName', 'userEmail', 'userAddress'];

  @override
  void initState(){
    final UserModel userInfo = Provider.of<UserProvider>(context, listen: false).user;
    if(userInfo != null){
      userInform[0] = userInfo.firstName;
      userInform[1] = userInfo.lastName;
      userInform[2] = userInfo.userEmail;
      userInform[3] = userInfo.yourAddress;
    }
    
    super.initState();
  }  

  Widget _buildEditBar(BuildContext context){
    return AppBar(
      backgroundColor: BasicAppBarColor,
      title: Text("Modify"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ), onPressed: () => _buildEditForm(context),
        )
      ],
    );
  }

  Widget _buildEditBody(){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      color: BasicBackgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basicPadding * 2),
          child: Form(
            key: _formEditKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEditFirstName(),
                TransparentDivider(),
                _buildEditLastName(),
                TransparentDivider(),
                _buildEditEmail(),
                TransparentDivider(),
                _buildEditAddress(),
              ]
            ) 
          ),
        ),
      ),
    );
  }

  Widget _buildModifyInfo(String text, int index){
    return index != 2 || text == userInform[2] ? 
      TextFormField(
        initialValue: text,
        validator: (value){
          if(value.isEmpty) return 'Please fill the ${'text'} in your blank.';
          return null;
        },
        onSaved: (value) => userInform[index] = value,
      ) : TextFormField(
        initialValue: text,
        validator: (value){
          Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern); 
          if(value.isEmpty) return 'Please fill the ${'text'} in your blank.';
          else if(!regex.hasMatch(value)){return 'Please enter VALID E-Mail!!';}
          return null;
        },
        onSaved: (value) => userInform[index] = value
    );
  }

  Widget _buildEditFirstName(){
    return CardTile(
      child: Column(
        children: [
          Text("FirstName"),
          _buildModifyInfo(userInform[0], 0)
        ],
      )
    );
  }

  Widget _buildEditLastName(){
    return CardTile(
      child: Column(
        children: [
          Text("LastName"),
          _buildModifyInfo(userInform[1], 1)
        ],
      )
    );
  }

  Widget _buildEditEmail(){
    return CardTile(
      child: Column(
        children: [
          Text("Email"),
          _buildModifyInfo(userInform[2], 2)
        ],
      )
    );
  }

  Widget _buildEditAddress(){
    return CardTile(
      child: Column(
        children: [
          Text("Address"),
          _buildModifyInfo(userInform[3], 3)
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildEditBar(context),
      body: _buildEditBody(),
      backgroundColor: BasicBackgroundColor,
    );
  }

  void _buildEditForm(BuildContext context){
    if(!_formEditKey.currentState.validate()) return;
    _formEditKey.currentState.save();
    
    Provider.of<UserProvider>(context).modifyUser(userInform);
    Navigator.pushNamed(context, "/settings");
  }
}