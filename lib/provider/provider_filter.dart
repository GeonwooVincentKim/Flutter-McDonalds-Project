import 'package:flutter/material.dart';


class FilterProvider with ChangeNotifier{
  final Map<String, dynamic> _orders = {
    'releaseDate': '',
    'releaseDateYear': null,
    'releaseDateMonth': null,
  };
  
  final Map<String, dynamic> _prevOrders = {
    'releaseDate': '',
    'releaseDateYear': null,
    'releaseDateMonth': null
  };

  Map<String, dynamic> get orderFilters {
    return {..._orders};
  }

  Map<String, dynamic> get prevOrderFilters {
    return {..._prevOrders};
  }

  void changeOrderFilters(Map<String, dynamic> newFilter){
    _orders['releaseDate'] = newFilter['releaseDate'];
    _orders['releaseDateYear'] = newFilter['releaseDateYear'];
    _orders['releaseDateMonth'] = newFilter['releaseDateMonth'];
    notifyListeners();
  }

  void changePrevOrderFilters(Map<String, dynamic> newFilter){
    _prevOrders['releaseDate'] = newFilter['releaseDate'];
    _prevOrders['releaseDateYear'] = newFilter['releaseDateYear'];
    _prevOrders['releaseDateMonth'] = newFilter['releaseDateMonth'];
    notifyListeners();
  }

  void resetOrderFilter(){
    _orders['releaseDate'] = '';
    _orders['releaseDateYear'] = null;
    _orders['releaseDateMonth'] = null;
    notifyListeners();
  }

  void resetPrevOrderFilter(){
    _prevOrders['releaseDate'] = '';
    _prevOrders['releaseDateYear'] = null;
    _prevOrders['releaseDateMonth'] = null;
    notifyListeners();
  }
}