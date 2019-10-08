import 'package:flutter_ld_shops/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../config/service_url.dart';
import '../../model/categoryGoodsList.dart';
import '../../service/service_method.dart';
import 'dart:convert';
import '../../provide/child_category.dart';
import '../../model/category.dart';
import 'package:provide/provide.dart';
import '../../provide/currentIndex.dart';
class BannerPage extends StatelessWidget {
  final List bannerListData;

  BannerPage({this.bannerListData});

  @override
  Widget build(BuildContext context) {
    if (bannerListData.length > 10) {
      bannerListData.removeRange(10, bannerListData.length);
    }
    var tempIndex = -1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.all(3.0),
      height: ScreenUtil.getInstance().setHeight(320),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: bannerListData.map((item) {
          tempIndex++;
          return _gridViewItemUI(item, tempIndex,context);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItemUI(item, index,context) {
    return InkWell(
      onTap: () {
        print(item['mallCategoryName']);
        _GoCategory(context,index,item['mallCategoryId']);

       // Application.router.navigateTo(context,'/detail?id=${item['goodsId']}');

      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil.getInstance().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
}
void _GoCategory(context,int index,String categroyId) async{
  await ldRequest('', formData22: 'getCategory').then((val) {
    var data = json.decode(val.toString());
    CategoryModel category = CategoryModel.fromJson(data);
    List list = category.data;

    Provide.value<ChildCategory>(context).changeCategory(categroyId, index);
    Provide.value<ChildCategory>(context).getChildCategory(list[index].bxMallSubDto, categroyId);
    Provide.value<CurrentIndexProvide>(context).changeIndex(index);

  });
  }
