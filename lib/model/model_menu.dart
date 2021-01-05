import 'package:flutter/material.dart';


class MenuModel{
  final String id;
  final String menuTitle;
  final String image;
  final int prices;
  int type;
  final String releaseDate;
  // final String releaseYear;
  // final String releaseMonth;
  final bool isInCart;
  List<MenuModel> childList;

  MenuModel({
    @required this.id,
    @required this.menuTitle,
    @required this.image,
    this.isInCart,
    this.prices,
    // this.type,
    this.releaseDate,
    // this.releaseYear,
    // this.releaseMonth,
    this.childList
  });

  factory MenuModel.fromMenuModelInfo(MenuModel menu){
    return MenuModel(
      id: menu.id ?? '',
      menuTitle: menu.menuTitle ?? '',
      image: menu.image ?? '',
      prices: menu.prices ?? 0,
      // type: menu.type ?? '',
      releaseDate: menu.releaseDate ?? '',
      // releaseYear: menu.releaseYear ?? '',
      // releaseMonth: menu.releaseMonth ?? '',
      childList: menu.childList ?? []
    );
  }

  factory MenuModel.fromMenuModelMapInfo(Map<String, dynamic> menuMap){
    return MenuModel(
      id: menuMap['id'] ?? '',
      menuTitle: menuMap['menuTitle'] ?? '',
      image: menuMap['image'] ?? '',
      prices: menuMap['prices'] ?? 0,
      // type: menuMap['type'] ?? 0,
      releaseDate: menuMap['releaseYearMonth'] ?? '',
      // releaseYear: menuMap['releaseYear'] ?? '',
      // releaseMonth: menuMap['releaseMonth'] ?? '',
      childList: menuMap['childList'] ?? []
    );
  }


  factory MenuModel.initialData(){
    return MenuModel(
      id: '',
      menuTitle: '',
      image: '',
      prices: 0,
      // type: 0,
      releaseDate: ''
      // releaseYear: '',
      // releaseMonth: ''
    );
  }
}
