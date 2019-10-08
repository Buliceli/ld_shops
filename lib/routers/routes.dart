import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

class Routes{
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (context,Map<String,List<String>> params){
        print('路由跳转错误---没发现路由页');
      }
    );
    router.define(detailsPage, handler: detailsHandler);
  }
}

Handler detailsHandler = Handler(
   handlerFunc: (context,Map<String,List<String>> params){
     String goodsId = params['id'].first;
     return DetailsPage(goodsId);
   }

);