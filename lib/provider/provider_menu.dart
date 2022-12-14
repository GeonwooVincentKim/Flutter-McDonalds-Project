import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_detail_menu.dart';
import 'package:myTestApp_Test/model/dummy/dummy_special_menu.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
// import 'package:myTestApp_Test/model/dummy/dummy_unified_menu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';


class ProviderMenu extends ChangeNotifier{
  MenuModel menuDetail;
  MenuModel specialMenu;
  int sum = 0;

  List<MenuModel> _addCartItems = [];
  List<MenuModel> _addOrderedItems = [];

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
  MenuModel get selectedMenu => menuDetail != null ? MenuModel.fromMenuModelInfo(selectedMenu) : '';
  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.prices);

  void selectMenu(MenuModel menuContent){
    menuDetail = menuContent;
    notifyListeners();
  }

  // Add the items that the User selected to the Cart.
  void addToCart(MenuModel menuAdd){
    _addCartItems.add(menuAdd);
    notifyListeners();
  }

  // Add the items that the User ordered from the Cart.
  void addToOrder(MenuModel menuOrderAdd){
    _addOrderedItems.add(menuOrderAdd);
    _addCartItems.clear();  // Clear '_addCartItems' after adds in '_addOrderedItems'.
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
    _menuSpecialItems.add(menuSettings);
    notifyListeners();
  }

  void deleteCartMenu(MenuModel menuDelete){
    _addCartItems.clear();
    notifyListeners();
  }
}