import 'package:flutter/material.dart';

class HotGoodsProvide with ChangeNotifier{
  List goods = [];
  changeGoods(List newGoods){
    goods = newGoods;
    notifyListeners();
  }
}