import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_category.dart';
import 'package:myTestApp_Test/model/model_category.dart';


class ProviderCategory with ChangeNotifier{
  CategoryModel category;
  List<CategoryModel> _categoryList = DUMMY_CATEGORY.toList();
  List<CategoryModel> get categoryList => [..._categoryList];

  CategoryModel get selectedCategory => category != null ? CategoryModel.getInfo(category) : null;
  void selectMenu(CategoryModel cate){
    category = cate;
    notifyListeners();
  }
}