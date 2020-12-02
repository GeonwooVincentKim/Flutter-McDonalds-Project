import 'dart:math';
import 'package:flutter/material.dart';


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