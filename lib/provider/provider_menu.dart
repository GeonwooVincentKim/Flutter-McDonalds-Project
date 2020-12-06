import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/model/dummy/dummy_menu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';


class ProviderMenu extends ChangeNotifier{
  MenuModel menu;
  int sum = 0;

  List<MenuModel> _addCartItems = [];
  List<MenuModel> _addOrderedItems = [];
  List<MenuModel> _menuItems = DUMMY_MENU.toList();
  
  List<MenuModel> get menuList => [..._menuItems]; 
  List<MenuModel> get cartList => [..._addCartItems];
  List<MenuModel> get orderList => [..._addOrderedItems];

  MenuModel get selectedMenu => menu != null ? MenuModel.fromMenuModelInfo(menu) : null;
  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.prices);

  void selectMenu(MenuModel menuContent){
    menu = menuContent;
    notifyListeners();
  }

  void addMenu(MenuModel menuAdd){
    _addCartItems.add(menuAdd);
    notifyListeners();
  }
  
  void addOrder(MenuModel menuOrderAdd){
    _addOrderedItems.add(menuOrderAdd);
    notifyListeners();
  }

  // void createMenu(MenuModel menuCreate){
  //   menuCreate.id = getRandomString(2);
  //   final MenuModel menuAttribute = MenuModel.fromMenuModelInfo(menuCreate);
  //   _menuItems.add(menuAttribute);
  //   notifyListeners();
  // }

  void createMenu(Map<String, dynamic> menuCreate){
    menuCreate['id'] = getRandomString(2);
    final MenuModel menuSettings = MenuModel.fromMenuModelMapInfo(menuCreate);
    _menuItems.add(menuSettings);
    notifyListeners();
  }

  void deleteOrderMenu(MenuModel menuDelete){
    _addCartItems.remove(menuDelete);
    notifyListeners();
  }
}