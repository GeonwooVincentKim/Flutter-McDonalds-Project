import 'package:flutter/material.dart';


class FoodModel{
  final String id;
  final String foodTitle;
  final String image;
  final int prices;
  int type;
  final String releaseDate;
  // final String releaseYear;
  // final String releaseMonth;
  final bool isInCart;
  List<FoodModel> childList;

  FoodModel({
    @required this.id,
    @required this.foodTitle,
    @required this.image,
    this.isInCart,
    this.prices,
    // this.type,
    this.releaseDate,
    // this.releaseYear,
    // this.releaseMonth,
    this.childList
  });

  factory FoodModel.fromFoodModelInfo(FoodModel menu){
    return FoodModel(
      id: menu.id ?? '',
      foodTitle: menu.foodTitle ?? '',
      image: menu.image ?? '',
      prices: menu.prices ?? 0,
      // type: menu.type ?? '',
      releaseDate: menu.releaseDate ?? '',
      // releaseYear: menu.releaseYear ?? '',
      // releaseMonth: menu.releaseMonth ?? '',
      childList: menu.childList ?? []
    );
  }

  factory FoodModel.fromFoodModelMapInfo(Map<String, dynamic> menuMap){
    return FoodModel(
      id: menuMap['id'] ?? '',
      foodTitle: menuMap['foodTitle'] ?? '',
      image: menuMap['image'] ?? '',
      prices: menuMap['prices'] ?? 0,
      // type: menuMap['type'] ?? 0,
      releaseDate: menuMap['releaseYearMonth'] ?? '',
      // releaseYear: menuMap['releaseYear'] ?? '',
      // releaseMonth: menuMap['releaseMonth'] ?? '',
      childList: menuMap['childList'] ?? []
    );
  }


  factory FoodModel.initialData(){
    return FoodModel(
      id: '',
      foodTitle: '',
      image: '',
      prices: 0,
      // type: 0,
      releaseDate: ''
      // releaseYear: '',
      // releaseMonth: ''
    );
  }
}
