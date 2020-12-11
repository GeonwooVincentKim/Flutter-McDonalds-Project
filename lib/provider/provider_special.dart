import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_special.dart';


class ProviderSpecial with ChangeNotifier{
  ModelSpecial spModel;

  List<ModelSpecial> _specialList = []; // From dummy DATA
  List<ModelSpecial> _addCartList = [];
  List<ModelSpecial> _addOrderList = [];

  List<ModelSpecial> get specialList => [..._specialList];
  List<ModelSpecial> get cartList => [..._addCartList];
  List<ModelSpecial> get orderList => [..._addOrderList];

  int get totalPrices => cartList.fold(0, (sum, current) => sum + current.spPrice);
}