import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';


class FilterProvider with ChangeNotifier{
  MenuModel menuFilter = MenuModel(releaseYear: null, releaseMonth: null);
  MenuModel get orderMap => menuFilter;
  List<MenuModel> ordersNoMap = [];
  List<String> _orderStrings = [

  ];

  List<MenuModel> get orderFilterNoMap => [...ordersNoMap];
  final Map<String, dynamic> _orders = {
    'releaseYear': '',
    'releaseYearText': null,
    'releaseMonth': '',
    'releaseMonthText': null
  };
  
  final Map<String, dynamic> _prevOrders = {
    'releaseYear': '',
    'releaseYearText': null,
    'releaseMonth': '',
    'releaseMonthText': null
  };

  Map<String, dynamic> get orderFilters {
    return {..._orders};
  }

  Map<String, dynamic> get prevOrderFilters {
    return {..._prevOrders};
  }

  void changeOrderFilters(Map<String, dynamic> newFilter){
    _orders['releaseYear'] = newFilter['releaseYear'];
    _orders['releaseYearText'] = newFilter['releaseYearText'];
    _orders['releaseMonth'] = newFilter['releaseMonth'];
    _orders['releaseMonthText'] = newFilter['releaseMonthText'];
    notifyListeners();
  }

  void changeOrderNoMapFilters(MenuModel mainFilter){
    orderMap.releaseYear = mainFilter.releaseYear;
    orderMap.releaseMonth = mainFilter.releaseMonth;
    notifyListeners();
  }

  void changePrevOrderFilters(Map<String, dynamic> newFilter){
    _prevOrders['releaseYear'] = newFilter['releaseYear'];
    _prevOrders['releaseMonth'] = newFilter['releaseMonth'];
    notifyListeners();
  }

  void resetOrderFilter(){
    _orders['releaseYear'] = '';
    _orders['releaseMonth'] = '';
    notifyListeners();
  }

  void resetOrderNoMapFilter(){
    orderMap.releaseYear = '';
    orderMap.releaseMonth = '';
    notifyListeners();
  }

  void resetPrevOrderFilter(){
    _prevOrders['releaseYear'] = '';
    _prevOrders['releaseMonth'] = '';
    notifyListeners();
  }
}