import 'package:flutter/material.dart';
import 'package:myTestApp/data/dummy_main_menu.dart';
import 'package:myTestApp/data/dummy_menu.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/shared/helpers/function.dart';


class MenuProvider with ChangeNotifier{
  MenuModel menu;
  int sum = 0;


  // List<MainMenuModel> _menuList = DUMMY_MAIN_MENUS.toList();
  List<MenuModel> _addCartItems = [];
  List<MenuModel> _MenuItems = [];
  // List<>_items = [];

  List<MenuModel> _subMenuItems = DUMMY_DETAIL.toList();
  List<MenuModel> _hamburgerItems = DUMMY_HAMBURGER.toList();
  List<MenuModel> _dessertItems = DUMMY_DESSERT.toList();
  List<MenuModel> _cafeItems = DUMMY_CAFE.toList();
  List<MenuModel> _morningItmes = DUMMY_MORNING.toList();

  // List<MainMenuModel> get menuList => [..._menuList];
  List<MenuModel> get cartItems => [..._addCartItems];
  List<MenuModel> get subMenuItems => [..._subMenuItems];
  List<MenuModel> get hamburgerItems => [..._hamburgerItems];
  List<MenuModel> get dessertItems => [..._dessertItems];
  List<MenuModel> get cafeItems => [..._cafeItems];
  List<MenuModel> get morningItems => [..._morningItmes];
  
  MenuModel get selectedDetailMenu => menu != null ? MenuModel.fromMenuModelInfo(selectedDetailMenu) : null;
  int get totalPrices => cartItems.fold(0, (sum, current) => sum + current.prices);
  MenuModel get subMenu {return MenuModel.fromMenuModelInfo(menu);}

  void selectMainMenu(MenuModel menuSub){
    menu = menuSub;
    notifyListeners();
  }
  // _items.add(MenuModel('ham', '23'));
  
  void createSubMenu(List<String> _subMenu){
    // _subMenu.id = getRandomString(2);
    // final MenuModel subMenu = MenuModel.fromMenuModelInfo(_subMenu);
    // _addCartItems.add(subMenu);
    MenuModel detailMenu = MenuModel(
      id: _subMenu[0] = getRandomString(2),
      menuTitle: _subMenu[1],
      image: _subMenu[2],
      prices: int.parse(_subMenu[3]),
      releaseDate: _subMenu[4]
    );
    _addCartItems.add(detailMenu);
  }

  void createMainMenu(Map<String, dynamic> mainMenu){
    mainMenu['id'] = getRandomString(2);
    final MenuModel menu = MenuModel.fromMenuModelMapInfo(mainMenu);
    _addCartItems.add(menu);
  }

  void createDetailMenu(Map<String, dynamic> detailMenu){
    detailMenu['id'] = getRandomString(2);
    final MenuModel menu = MenuModel.fromMenuModelMapInfo(detailMenu);
    _addCartItems.add(menu);
  }
  
  void selectDetailMenu(MenuModel menuDetails){
    menu = menuDetails; 
    notifyListeners();
  }

  void addDetailMenu(MenuModel menuDetails) {
    _addCartItems.add(menuDetails); 
    notifyListeners();
  }

  void deleteDetailMenu(MenuModel menuDetails){
    _addCartItems.remove(menuDetails);
    notifyListeners();
  }

}