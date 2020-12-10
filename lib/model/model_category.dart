import 'package:flutter/material.dart';


class CategoryModel{
  final String categoryID;
  final String name;
  final String image;

  CategoryModel({
    @required this.categoryID,
    @required this.name,
    @required this.image
  });

  factory CategoryModel.initialize(CategoryModel cate){
    return CategoryModel(
      categoryID: '',
      name: '',
      image: ''
    );
  }
}
