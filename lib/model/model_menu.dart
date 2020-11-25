import 'package:flutter/material.dart';


class MenuModel{
  final String id;
  final String menuTitle;
  final String image;
  final int prices;
  final int type;
  final String releaseDate;
  bool isInCart;

  MenuModel({
    @required this.id,
    @required this.menuTitle,
    @required this.image,
    this.isInCart,
    @required this.prices,
    this.type,
    @required this.releaseDate,
  });

  factory MenuModel.fromMenuModelInfo(MenuModel menu){
    return MenuModel(
      id: menu.id ?? '',
      menuTitle: menu.menuTitle ?? '',
      image: menu.image ?? '',
      prices: menu.prices ?? 0,
      type: menu.type ?? 0,
      releaseDate: menu.releaseDate ?? ''
    );
  }

  factory MenuModel.fromMenuModelMapInfo(Map<String, dynamic> menuMap){
    return MenuModel(
      id: menuMap['id'] ?? '',
      menuTitle: menuMap['menuTitle'] ?? '',
      image: menuMap['image'] ?? '',
      prices: menuMap['prices'] ?? 0,
      type: menuMap['type'] ?? 0,
      releaseDate: menuMap['releaseDate'] ?? ''
    );
  }


  factory MenuModel.initialData(){
    return MenuModel(
      id: '',
      menuTitle: '',
      image: '',
      prices: 0,
      type: 0,
      releaseDate: ''
    );
  }
}