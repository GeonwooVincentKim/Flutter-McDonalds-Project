import 'package:flutter/material.dart';


class UserModel{
  final String id;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String yourAddress;

  UserModel({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.userEmail,
    @required this.yourAddress
  });

  factory UserModel.fromUserInfo(UserModel user){
    return UserModel(
      id: user.id ?? '',
      firstName: user.firstName ?? '',
      lastName: user.lastName ?? '',
      userEmail: user.userEmail ?? '',
      yourAddress: user.yourAddress ?? '',
    );
  }

  // factory UserModel.fromUserInfoMap(Map<String, dynamic> user){
  //   return UserModel(
  //     id: user['id'] ?? '',
  //     firstName: user['firstName'] ?? '',
  //     lastName: user['lastName'] ?? '',
  //     userEmail: user['userEmail'] ?? '',
  //     yourAddress: user['userAddress'] ?? '',
  //   );
  // }

  // factory UserModel.initialData(){
  //   return UserModel(
  //     id: '',
  //     firstName: '',
  //     lastName: '',
  //     userEmail: '',
  //     yourAddress: ''
  //   );
  // }
}