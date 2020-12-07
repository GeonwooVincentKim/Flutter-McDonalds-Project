import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';


const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_)
  => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

DateTime getDateTimeFromString(String date) {
  if(date.contains('/')) {
    // final String stringDate = date.replaceAll('/', '-');
    // return DateTime.parse(stringDate);
  } else {
    final DateTime today = DateTime.now();
    // return DateTime.parse('$today.month');
    // print(date);
    // return DateTime.parse('');
    // print(today.year.toString() + today.month.toString());
    // return DateTime.parse("$date/${today.month}");
    return DateTime(int.parse(date));
    // return DateTime.parse(today.year.toString());
  } 
}

DateTime getDateTimeMonthString(String dateMonth){
  if(dateMonth.contains('/')){
    final String stringMonth = dateMonth.replaceAll('/', '-');
    return DateTime.parse(stringMonth);
  } else {
    final DateTime today = DateTime.now();
    return DateTime(int.parse(dateMonth) + today.month);
  }
}

DateTime getDateTimeNoDashString(String date){
  if(date.contains('/')){
    final String stringDate = date.replaceAll("/", "-");
    return DateTime.parse(stringDate);
  }
}

// bool checkFilter(MenuModel menu, Map<String, dynamic> newFilter){
//   final DateTime releaseYearMonth = menu.releaseDate != '' ? getDateTimeFromString(menu.releaseDate) : null;
//   // // print(releaseYearMonth);
//   // // print(getDateTimeFromString(menu.releaseDate));
//   if((newFilter['releaseYear'] == null || newFilter['releaseYear'] == releaseYearMonth.year.toString())
//   && (newFilter['releaseMonth'] == null || newFilter['releaseMonth'] == releaseYearMonth.month.toString())){
//   //   print(newFilter['releaseYear']);
//   //   return true;
//   }
//   return false;
// }
// bool checkFilter(MenuModel menu, MenuModel newFilter){
//   final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
//   // final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
//   if((newFilter.releaseYear == '' || newFilter.releaseYear == releaseYear.year.toString()) && 
//   newFilter.releaseMonth == '' || newFilter.releaseYear == releaseYear.month.toString()){
//     return true;
//   }
//   return false;
// }

bool checkFilter(MenuModel menu, Map<String, dynamic> newFilter){
  // final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
  // final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
  final String releaseYear = menu.releaseYear != '' ? menu.releaseYear : null;
  final String releaseMonth = menu.releaseMonth != '' ? menu.releaseMonth : null;
  if((newFilter['releaseYearText'] == null || newFilter['releaseYearText'] == releaseYear.toString()) &&
  newFilter['releaseMonthText'] == null || newFilter['releaseMonthText'] == releaseMonth.toString()){
    // print(releaseYear.year);
    print(releaseYear);
    print(releaseMonth);
    return true;
  }
  return false;
}