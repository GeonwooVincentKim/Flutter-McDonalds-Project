import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';


class MenuProvider extends ChangeNotifier{
  MenuModel menu;
  int sum = 0;
  List<MenuModel> _addCartItems = [];
}