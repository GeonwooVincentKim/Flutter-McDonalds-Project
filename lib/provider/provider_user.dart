import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_user.dart';
import 'package:myTestApp_Test/model/model_user.dart';


class UserProvider with ChangeNotifier{
  UserModel _userList = USER_INFO;
  UserModel userModel;
  UserModel get user {return UserModel.fromUserInfo(_userList);}


  void modifyUser(List<String> _formUserInfoData){
    UserModel modifyUser = UserModel(
      id: _userList.id,
      firstName: _formUserInfoData[0],
      lastName: _formUserInfoData[1],
      userEmail: _formUserInfoData[2],
      yourAddress: _formUserInfoData[3],
    );
    _userList = modifyUser;
    notifyListeners();
  }
}