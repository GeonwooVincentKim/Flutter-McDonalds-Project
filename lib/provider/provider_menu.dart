import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_detail_menu.dart';
import 'package:myTestApp_Test/model/dummy/dummy_special_menu.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
// import 'package:myTestApp_Test/model/dummy/dummy_unified_menu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';


class ProviderMenu extends ChangeNotifier{
  MenuModel category;
  MenuModel menuDetail;
  MenuModel specialMenu;
  int sum = 0;

  List<MenuModel> _addCartItems = [];
  List<MenuModel> _addOrderedItems = [];
  List<MenuModel> _addSpecialItems = [];

  // Import DUMMY_MENU list and DUMMY_SPECIAL list.
  List<MenuModel> _menuItems = DUMMY_MENU.toList();
  List<MenuModel> _menuSpecialItems = DUMMY_SPECIAL.toList();

  // Get _menuItems which already involves
  // DUMMY_MENU list and DUMMY_SPECIAL list to List.
  List<MenuModel> get menuList => [..._menuItems];
  List<MenuModel> get specialMenuList => [..._menuSpecialItems];
  List<MenuModel> get cartList => [..._addCartItems];
  List<MenuModel> get orderList => [..._addOrderedItems];

  // Bring the Category
  MenuModel get selectedCategory => category;
  MenuModel get selectedMenu => menuDetail != null ? MenuModel.fromMenuModelInfo(selectedMenu) : '';
  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.prices);

  void selectMenu(MenuModel menuContent){
    menuDetail = menuContent;
    notifyListeners();
  }

  void selectCategory(MenuModel categoryContent){
    category = categoryContent;
    notifyListeners();
  }

  // Add new elements.
  void addToCart(MenuModel menuAdd){
    _addCartItems.add(menuAdd);
    notifyListeners();
  }

  void addToOrder(MenuModel menuOrderAdd){
    _addOrderedItems.add(menuOrderAdd);
    _addCartItems.clear();
    notifyListeners();
  }

  void addCart(List<MenuModel> list){
    list = _addCartItems;
    _addOrderedItems.addAll(list);
    list.remove(list);
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
    // _menuItems.add(menuSettings);
    _menuSpecialItems.add(menuSettings);
    notifyListeners();
  }

  void deleteOrderMenu(MenuModel menuDelete){
    _addCartItems.clear();
    notifyListeners();
  }

  void deleteCartMenu(List<MenuModel> list){
    _addCartItems.remove(list);
    notifyListeners();
  }
}