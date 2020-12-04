import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';


class FilterProvider with ChangeNotifier{
  // MenuModel menuFilter = MenuModel(releaseYear: null, releaseMonth: null);
  List<MenuModel> ordersNoMap = [];
  List<String> _orderStrings = [
    
  ];

  List<MenuModel> get orderFilterNoMap => [...ordersNoMap];
  final Map<String, dynamic> _orders = {
    'releaseYearMonth': '',
    'releaseYear': null,
    'releaseMonth': null,
  };
  
  final Map<String, dynamic> _prevOrders = {
    'releaseYearMonth': '',
    'releaseYear': null,
    'releaseMonth': null,
  };

  Map<String, dynamic> get orderFilters {
    return {..._orders};
  }

  Map<String, dynamic> get prevOrderFilters {
    return {..._prevOrders};
  }

  void changeOrderFilters(Map<String, dynamic> newFilter){
    _orders['releaseYearMonth'] = newFilter['releaseYearMonth'];
    _orders['releaseYear'] = newFilter['releaseYear'];
    _orders['releaseMonth'] = newFilter['releaseMonth'];
    notifyListeners();
  }

  // void changeOrderNoMapFilters(MenuModel mainFilter){
  //   menuFilter.releaseYear = mainFilter.releaseYear;
  //   menuFilter.releaseMonth = mainFilter.releaseMonth;
  //   notifyListeners();
  // }

  void changePrevOrderFilters(Map<String, dynamic> newFilter){
    _prevOrders['releaseYearMonth'] = newFilter['releaseYearMonth'];
    _prevOrders['releaseYear'] = newFilter['releaseYear'];
    _prevOrders['releaseMonth'] = newFilter['releaseMonth'];
    notifyListeners();
  }

  void resetOrderFilter(){
    _orders['releaseYearMonth'] = '';
    _orders['releaseYear'] = null;
    _orders['releaseMonth'] = null;
    notifyListeners();
  }

  // void resetOrderNoMapFilter(){
  //   menuFilter.releaseYear = '';
  //   menuFilter.releaseMonth = '';
  //   notifyListeners();
  // }

  void resetPrevOrderFilter(){
    _prevOrders['releaseYearMonth'] = null;
    _prevOrders['releaseYear'] = null;
    _prevOrders['releaseMonth'] = null;
    notifyListeners();
  }
}