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
    return DateTime.parse('$date-${today.month + 1}-01');
  } 
}

DateTime getDateTimeNoDashString(String date){
  
}

bool checkFilter(MenuModel menu, MenuModel newFilter){
  final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
  final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
  if((newFilter.releaseYear == '' || newFilter.releaseYear == releaseYear.year.toString()) && 
  newFilter.releaseMonth == '' || newFilter.releaseYear == releaseMonth.month.toString()){
    return true;
  }
  return false;
}
