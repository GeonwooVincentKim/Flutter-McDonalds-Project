import 'package:flutter/material.dart';


class FilterProvider with ChangeNotifier{
  final Map<String, dynamic> _orders = {
    'releaseDateYear': null,
    
  };
}