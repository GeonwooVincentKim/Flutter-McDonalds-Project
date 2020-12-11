import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/dummy/dummy_home.dart';
import 'package:myTestApp_Test/model/model_home.dart';


class ProviderHome with ChangeNotifier{
  ModelHome homeMenu;
  List<ModelHome> _listHome = DUMMY_HOME.toList();
  List<ModelHome> get homeContent => [..._listHome];

  ModelHome get selectedHome => homeMenu != null ? ModelHome.fromHomeInfo(selectedHome) : null;
  void selectHomeMenu(ModelHome home){
    homeMenu = home;
    notifyListeners();
  }
}