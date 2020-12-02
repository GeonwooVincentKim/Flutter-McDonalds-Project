import 'package:flutter/material.dart';


class Category{
  String id;
  String foodName;
  String mainImage;
  int type;
  
  Category({
    @required this.id,
    @required this.foodName,
    @required this.mainImage,
    this.type
  });

  factory Category.fromMainMenu(Category mainMenu){
    return Category(
      id: mainMenu.id ?? '',
      foodName: mainMenu.foodName ?? '',
      mainImage: mainMenu.mainImage ?? '',
      type: mainMenu.type ?? ''
    );
  }

  factory Category.fromMainMenuMap(Map<String, dynamic> mainMenu){
    return Category(
      id: mainMenu['id'],
      foodName: mainMenu['foodName'],
      mainImage: mainMenu['mainImage'],
      type: mainMenu['type']
    );
  }

  factory Category.initialMainPage(){
    return Category(
      id: '',
      foodName: '',
      mainImage: '',
      type: 0
    );
  }
}