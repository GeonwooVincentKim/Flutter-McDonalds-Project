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
    // 'releaseYear': '',
    // 'releaseYearText': null,
    // 'releaseMonth': '',
    // 'releaseMonthText': null
  };
  
  final Map<String, dynamic> _prevOrders = {
    'releaseYearMonth': '',
    'releaseYear': null,
    'releaseMonth': null,
    // 'releaseYear': '',
    // 'releaseYearText': null,
    // 'releaseMonth': '',
    // 'releaseMonthText': null
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
    // _orders['releaseYear'] = newFilter['releaseYear'];
    // _orders['releaseYearText'] = newFilter['releaseYearText'];
    // _orders['releaseMonth'] = newFilter['releaseMonth'];
    // _orders['releaseMonthText'] = newFilter['releaseMonthText'];
    notifyListeners();
  }

  // void changeOrderNoMapFilters(MenuModel mainFilter){
  //   menuFilter.releaseYear = mainFilter.releaseYear;
  //   menuFilter.releaseMonth = mainFilter.releaseMonth;
  //   notifyListeners();
  // }

  void changePrevOrderFilters(Map<String, dynamic> newFilter){
    // _prevOrders['releaseYear'] = newFilter['releaseYear'];
    // _prevOrders['releaseYearText'] = newFilter['releaseYearText'];
    // _prevOrders['releaseMonth'] = newFilter['releaseMonth'];
    // _prevOrders['releaseMonthText'] = newFilter['releaseMonthText'];
    _prevOrders['releaseYearMonth'] = newFilter['releaseYearMonth'];
    _prevOrders['releaseYear'] = newFilter['releaseYear'];
    _prevOrders['releaseMonth'] = newFilter['releaseMonth'];
    notifyListeners();
  }

  void resetOrderFilter(){
    _orders['releaseYearMonth'] = '';
    _orders['releaseYear'] = null;
    _orders['releaseMonth'] = null;
    // _orders['releaseYear'] = '';
    // _orders['releaseYearText'] = null;
    // _orders['releaseMonth'] = '';
    // _orders['releaseMonthText'] = null;
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
    // _prevOrders['releaseYear'] = '';
    // _prevOrders['releaseYearText'] = null;
    // _prevOrders['releaseMonth'] = '';
    // _prevOrders['releaseMonthText'] = null;
    notifyListeners();
  }
}