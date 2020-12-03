import 'package:flutter/material.dart';


class MenuModel{
  String id;
  String menuTitle;
  String image;
  int prices;
  int type;
  String releaseYear;
  String releaseMonth;
  bool isInCart;

  MenuModel({
    this.id,
    this.menuTitle,
    this.image,    
    this.prices,
    this.type,
    this.releaseYear,
    this.releaseMonth,
  });
  // MenuModel() {
    
  // }
  // MenuModel.fromData({
  //   @required this.id,
  //   @required this.menuTitle,
  //   @required this.image,    
  //   this.prices,
  //   this.type,
  //   this.releaseDate,
  //   this.children
  // });
 

  factory MenuModel.fromMenuModelInfo(MenuModel menu){
    return MenuModel(
      id: menu.id ?? '',
      menuTitle: menu.menuTitle ?? '',
      image: menu.image ?? '',
      prices: menu.prices ?? 0,
      type: menu.type ?? 0,
      releaseYear: menu.releaseYear ?? '',
      releaseMonth: menu.releaseMonth ?? '',
    );
  }
  // factory MenuModel.fromMenuModelInfo(MenuModel menu){
  //   return MenuModel.fromData(
  //     id: menu.id ?? '',
  //     menuTitle: menu.menuTitle ?? '',
  //     image: menu.image ?? '',
  //     prices: menu.prices ?? 0,
  //     type: menu.type ?? 0,
  //     releaseDate: menu.releaseDate ?? '',
  //     children: menu.children ?? [],
  //   );
  // }

  factory MenuModel.fromMenuModelMapInfo(Map<String, dynamic> menuMap){
    return MenuModel(
      id: menuMap['id'] ?? '',
      menuTitle: menuMap['menuTitle'] ?? '',
      image: menuMap['image'] ?? '',
      prices: menuMap['prices'] ?? 0,
      type: menuMap['type'] ?? 0,
      releaseYear: menuMap['releaseYear'] ?? '',
      releaseMonth: menuMap['releaseMonth'] ?? ''
    );
  }
  // factory MenuModel.fromMenuModelMapInfo(Map<String, dynamic> menuMap){
  //   return MenuModel.fromData(
  //     id: menuMap['id'] ?? '',
  //     menuTitle: menuMap['menuTitle'] ?? '',
  //     image: menuMap['image'] ?? '',
  //     prices: menuMap['prices'] ?? 0,
  //     type: menuMap['type'] ?? 0,
  //     releaseDate: menuMap['releaseDate'] ?? ''
  //   );
  // }


  // factory MenuModel.initialData(){
  //   return MenuModel.fromData(
  //     id: '',
  //     menuTitle: '',
  //     image: '',
  //     prices: 0,
  //     type: 0,
  //     releaseDate: ''
  //   );
  // }
}