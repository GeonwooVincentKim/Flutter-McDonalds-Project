import 'package:flutter/material.dart';


class Category{
  final String id;
  final String foodName;
  final String mainImage;
  final int type;
  
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