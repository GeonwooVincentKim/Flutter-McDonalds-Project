import 'package:flutter/material.dart';


class MainMenuModel{
  final String id;
  final String foodName;
  final String mainImage;
  final int type;
  
  MainMenuModel({
    @required this.id,
    @required this.foodName,
    @required this.mainImage,
    this.type
  });

  factory MainMenuModel.fromMainMenu(MainMenuModel mainMenu){
    return MainMenuModel(
      id: mainMenu.id ?? '',
      foodName: mainMenu.foodName ?? '',
      mainImage: mainMenu.mainImage ?? '',
      type: mainMenu.type ?? ''
    );
  }

  factory MainMenuModel.fromMainMenuMap(Map<String, dynamic> mainMenu){
    return MainMenuModel(
      id: mainMenu['id'],
      foodName: mainMenu['foodName'],
      mainImage: mainMenu['mainImage'],
      type: mainMenu['type']
    );
  }

  factory MainMenuModel.initialMainPage(){
    return MainMenuModel(
      id: '',
      foodName: '',
      mainImage: '',
      type: 0
    );
  }
}