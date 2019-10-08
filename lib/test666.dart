import 'dart:convert';

import 'package:flutter/material.dart';

void main(){

  //真是他妈的日了狗了
  String str ='''[{
                  "goodsId": "c9248599b4a1467fb0a485e60486c97e", 
                  "goodsName": "百事可乐330ml*6", 
                  "count": 1, 
                  "price": 12.0, 
                  "images": "https://images.baixingliangfan.cn/shopGoodsImg/20190911/20190911184050_995.jpg", 
                  "isCheck": true
                 }]''';
  print(str);

//  str =  '''[
//  {
//  "SCORE": 5,
//  "comments": "非常满意！",
//  "userName": "183******32",
//  "discussTime": 1561461950883
//  }]''';
//

  print('什么鬼');
  List list = (json.decode(str.toString()) as List).cast();
  //List list = Array as Li;
  print('+++++++++++++++');
  print(list);
  print('*****************');

}