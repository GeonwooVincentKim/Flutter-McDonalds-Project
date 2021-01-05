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

  factory FoodModel.fromFoodModelInfo(FoodModel food){
    return FoodModel(
      id: food.id ?? '',
      foodTitle: food.foodTitle ?? '',
      image: food.image ?? '',
      prices: food.prices ?? 0,
      // type: food.type ?? '',
      releaseDate: food.releaseDate ?? '',
      // releaseYear: food.releaseYear ?? '',
      // releaseMonth: food.releaseMonth ?? '',
      childList: food.childList ?? []
    );
  }

  factory FoodModel.fromFoodModelMapInfo(Map<String, dynamic> foodMap){
    return FoodModel(
      id: foodMap['id'] ?? '',
      foodTitle: foodMap['foodTitle'] ?? '',
      image: foodMap['image'] ?? '',
      prices: foodMap['prices'] ?? 0,
      // type: foodMap['type'] ?? 0,
      releaseDate: foodMap['releaseYearMonth'] ?? '',
      // releaseYear: foodMap['releaseYear'] ?? '',
      // releaseMonth: foodMap['releaseMonth'] ?? '',
      childList: foodMap['childList'] ?? []
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
