import 'package:flutter/material.dart';


class CategoryModel{
  final String categoryID;
  final String name;
  final String image;
  // int type;

  CategoryModel({
    @required this.categoryID,
    @required this.name,
    @required this.image,
    // this.type
  });

  factory CategoryModel.getInfo(CategoryModel cate){
    return CategoryModel(
      categoryID: cate.categoryID ?? '',
      name: cate.name ?? '',
      image: cate.image ?? '',
      // type: cate.type ?? 0
    );
  }

  factory CategoryModel.initialize(CategoryModel cate){
    return CategoryModel(
      categoryID: '',
      name: '',
      image: '',
      // type: 0
    );
  }
}
