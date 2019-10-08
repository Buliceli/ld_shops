import 'package:flutter/material.dart';

import 'category_page/left_nav.dart';
import 'category_page/right_nav.dart';
import 'category_page/goodsList.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '商品分类'
        ),
      ),
      body: Container(

        child: Row(
          children: <Widget>[
            LeftCategoryNav(),

            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList()
              ],
            )
          ],
        ),


      ),
    );
  }
}




