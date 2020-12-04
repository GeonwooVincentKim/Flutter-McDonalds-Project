import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';


const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_)
  => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

DateTime getDateTimeFromString(String date) {
  if(date.contains('/')) {
    final String stringDate = date.replaceAll('/', '-');
    return DateTime.parse(stringDate);
  } else {
    final DateTime today = DateTime.now();
    // return DateTime.parse('$today.month');
    // return DateTime.parse('$date-${today.month + 1}-01');
    // return DateTime.parse(today.year.toString());
    // return DateTime.parse(today.year.toString());
    
    print(today.year.toString() + today.month.toString());
    return DateTime(today.year + today.month);
    // return DateTime(int.parse(date) + today.month);
  } 
}

DateTime getDateTimeNoDashString(String date){
  
}

bool checkFilter(MenuModel menu, MenuModel newFilter){
  final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
  // final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
  if((newFilter.releaseYear == '' || newFilter.releaseYear == releaseYear.year.toString()) && 
  newFilter.releaseMonth == '' || newFilter.releaseYear == releaseYear.month.toString()){
    return true;
  }
  return false;
}

bool checkFilterMap(MenuModel menu, Map<String, dynamic> newFilter){
  final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
  final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
  if((newFilter['releaseYear'] == '' || newFilter['releaseYear'] == releaseYear.year.toString()) &&
  newFilter['releaseMonth'] == '' || newFilter['releaseMonth'] == releaseMonth.month.toString()){
    return true;
  }
  return false;
}