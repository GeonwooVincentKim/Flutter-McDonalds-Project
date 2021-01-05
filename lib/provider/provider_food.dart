import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_detail_menu.dart';
import 'package:myTestApp_Test/model/dummy/dummy_special_menu.dart';
import 'package:myTestApp_Test/model/model_food.dart';
// import 'package:myTestApp_Test/model/dummy/dummy_unified_food.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';


class ProviderFood extends ChangeNotifier{
  FoodModel category;
  FoodModel menuDetail;
  FoodModel specialMenu;
  int sum = 0;

  List<FoodModel> _addCartItems = [];
  List<FoodModel> _addOrderedItems = [];
  List<FoodModel> _addSpecialItems = [];

  // Import DUMMY_food list and DUMMY_SPECIAL list.
  List<FoodModel> _foodItems = DUMMY_MENU.toList();
  List<FoodModel> _foodSpecialItems = DUMMY_SPECIAL.toList();

  // Get _foodItems which already involves
  // DUMMY_food list and DUMMY_SPECIAL list to List.
  List<FoodModel> get foodList => [..._foodItems];
  List<FoodModel> get specialMenuList => [..._foodSpecialItems];
  List<FoodModel> get cartList => [..._addCartItems];
  List<FoodModel> get orderList => [..._addOrderedItems];

  // Bring the Category
  FoodModel get selectedMenu => menuDetail != null ? FoodModel.fromFoodModelInfo(selectedMenu) : '';
  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.prices);

  void selectMenu(FoodModel menuContent){
    menuDetail = menuContent;
    notifyListeners();
  }

  // Add the items that the User selected to the Cart.
  void addToCart(FoodModel menuAdd){
    _addCartItems.add(menuAdd);
    notifyListeners();
  }

  // Add the items that the User ordered from the Cart.
  void addToOrder(FoodModel menuOrderAdd){
    _addOrderedItems.add(menuOrderAdd);
    _addCartItems.clear();  // Clear '_addCartItems' after adds in '_addOrderedItems'.
    notifyListeners();
  }

  // void createMenu(FoodModel menuCreate){
  //   menuCreate.id = getRandomString(2);
  //   final FoodModel menuAttribute = FoodModel.fromFoodModelInfo(menuCreate);
  //   _foodItems.add(menuAttribute);
  //   notifyListeners();
  // }

  void createMenu(Map<String, dynamic> menuCreate){
    menuCreate['id'] = getRandomString(2);
    final FoodModel menuSettings = FoodModel.fromFoodModelMapInfo(menuCreate);
    _foodSpecialItems.add(menuSettings);
    notifyListeners();
  }

  void deleteCartMenu(FoodModel menuDelete){
    _addCartItems.clear();
    notifyListeners();
  }
}