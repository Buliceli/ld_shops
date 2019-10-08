import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:fluro/fluro.dart';
import 'routers/application.dart';
import 'routers/routes.dart';

import 'package:provide/provide.dart';
import 'provide/details_info.dart';
import 'provide/currentIndex.dart';
import 'provide/cart.dart';
import 'provide/child_category.dart';
import 'provide/category_goods_list.dart';
void main(){
  

  var detailsInfo = DetailsInfoProvide();
  var currentIndex = CurrentIndexProvide();
  var cartProvide = CartProvide();
  var category = ChildCategory();
  var categoryGoods = CategoryGoodsListProvide();


  var provides = Providers();

  provides
          ..provide(Provider<DetailsInfoProvide>.value(detailsInfo))
          ..provide(Provider<CurrentIndexProvide>.value(currentIndex))
          ..provide(Provider<CartProvide>.value(cartProvide))
          ..provide(Provider<ChildCategory>.value(category))
          ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoods));
  
  runApp(ProviderNode(
    child: MyApp(),
    providers: provides,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化路由
    final router = Router();
    Routes.configureRoutes(router);
    //创建一个类 静态持有router
    Application.router = router;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

