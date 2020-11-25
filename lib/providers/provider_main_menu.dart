import 'package:flutter/material.dart';
import 'package:myTestApp/data/dummy_main_menu.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/shared/helpers/function.dart';


class MainMenuProvider with ChangeNotifier{
  List<MainMenuModel> _mainMenuItems = DUMMY_MAIN_MENUS.toList();
  List<MainMenuModel> _addNewMainMenuItems = []; // For Add new Main Menu
  MainMenuModel menu;

  List<MainMenuModel> get mainMenuItems => [..._mainMenuItems];
  List<MainMenuModel> get newMainMenuItems => [..._addNewMainMenuItems];
  MainMenuModel get selectedMainMenu => menu != null ? MainMenuModel.fromMainMenu(selectedMainMenu) : null;
  // MainMenuModel get selectedMainMenu => menu != null ? null : MainMenuModel.fromMainMenu(selectedMainMenu);

  void createMain(List<String> _formCreateMain){
    MainMenuModel mainMenu = MainMenuModel(
      // id: getRandomString(2),
      id: _formCreateMain[0] = getRandomString(2),
      foodName: _formCreateMain[1],
      mainImage: _formCreateMain[2],
    );
    _mainMenuItems.add(mainMenu);
    notifyListeners();
  }

  void selectMainMenu(MainMenuModel menuMain){menu = menuMain; notifyListeners();}
  void addMainMenu(MainMenuModel menuMain){_addNewMainMenuItems.add(menuMain); notifyListeners();}
  
  void createMainMenu(Map<String, dynamic> mainMenu){
    mainMenu['id'] = getRandomString(2);
    final MainMenuModel menu = MainMenuModel.fromMainMenuMap(mainMenu);
    _addNewMainMenuItems.add(menu);
  }
}