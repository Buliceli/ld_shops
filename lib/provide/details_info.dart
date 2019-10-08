import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{
     DetailsModel  goodsModel = null;
     bool isLeft = true;
     bool isRight = false;

     //从后台获取商品信息
     getGoodsInfo(String id) async{
       await ldRequest('http://www.bai',formData22: 'getGoodDetailById?goodId=${id}').then((val){
         var responseData = json.decode(val.toString());
//         print('************************************');
//         print(responseData);
         goodsModel = DetailsModel.fromJson(responseData);
         notifyListeners();

       });
     }

     //改变tabBar的状态
      changeLeftAndRight(String changState){
        if(changState == 'left'){
          isLeft = true;
          isRight = false;
        }else{
          isLeft = false;
          isRight = true;
        }
        notifyListeners();
      }
}