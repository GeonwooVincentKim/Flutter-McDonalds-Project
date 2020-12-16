import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_detail_menu.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/model/dummy/dummy_menu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';


class ProviderMenu extends ChangeNotifier{
  MenuModel category;
  MenuModel menuDetail;
  MenuModel specialMenu;
  int sum = 0;

  List<MenuModel> _addCartItems = [];
  List<MenuModel> _addOrderedItems = [];
  List<MenuModel> _addSpecialItems = [];
  List<MenuModel> _menuItems = DUMMY_CATEGORY.toList();
  
  // List<MenuModel> _menuHam = DUMMY_HAM.toList();
  // List<MenuModel> _menuCafe = DUMMY_CAFE.toList();
  // List<MenuModel> _menuMorning = DUMMY_MORNING.toList();
  // List<MenuModel> _menuDessert = DUMMY_DESSERT.toList();

  List<MenuModel> _menuSpecialItems = DUMMY_SPECIAL.toList();
  // List<MenuModel> _menuItems = DUMMY_MENU.toList();

  List<MenuModel> get menuList => [..._menuItems];
  
  // List<MenuModel> get menuHam => [..._menuHam];
  // List<MenuModel> get menuCafe => [..._menuCafe];
  // List<MenuModel> get menuMorning => [..._menuMorning];
  // List<MenuModel> get menuDessert => [..._menuDessert];

  List<MenuModel> get specialMenuList => [..._menuSpecialItems];
  List<MenuModel> get cartList => [..._addCartItems];
  List<MenuModel> get orderList => [..._addOrderedItems];
  // List<MenuModel> get specialList => [..._addSpecialItems];

  MenuModel get selectedCategory => category;
  MenuModel get selectedMenu => menuDetail != null ? MenuModel.fromMenuModelInfo(selectedMenu) : '';
  // MenuModel get selectedMenu => menuDetail;
  // MenuModel get selectedSpecialMenu => specialMenu != null ? MenuModel.fromMenuModelInfo(selectedSpecialMenu) : null;
  // MenuModel get selectedCategory => category != null ? MenuModel.fromMenuModelInfo(category) : '';
  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.prices);

  void selectMenu(MenuModel menuContent){
    menuDetail = menuContent;
    notifyListeners();
  }

  void selectCategory(MenuModel categoryContent){
    category = categoryContent;
    notifyListeners();
  }

  // void selectSpecialMenu(MenuModel specialContent){
  //   specialMenu = specialContent;
  //   notifyListeners();
  // }

  // Add new elements.
  void addMenu(MenuModel menuAdd){
    _addCartItems.add(menuAdd);
    notifyListeners();
  }

  void addOrder(MenuModel menuOrderAdd){
    _addOrderedItems.add(menuOrderAdd);
    notifyListeners();
  }

  // void addSpecialMenu(MenuModel menuSpecialAdd){
  //   _addSpecialItems.add(menuSpecialAdd);
  //   notifyListeners();
  // }

  // void createMenu(MenuModel menuCreate){
  //   menuCreate.id = getRandomString(2);
  //   final MenuModel menuAttribute = MenuModel.fromMenuModelInfo(menuCreate);
  //   _menuItems.add(menuAttribute);
  //   notifyListeners();
  // }

  void createMenu(Map<String, dynamic> menuCreate){
    menuCreate['id'] = getRandomString(2);
    final MenuModel menuSettings = MenuModel.fromMenuModelMapInfo(menuCreate);
    // _menuItems.add(menuSettings);
    _menuSpecialItems.add(menuSettings);
    notifyListeners();
  }

  void deleteOrderMenu(MenuModel menuDelete){
    _addCartItems.remove(menuDelete);
    notifyListeners();
  }

  void deleteCartMenu(List<MenuModel> list){
    _addCartItems.remove(list);
    notifyListeners();
  }
}