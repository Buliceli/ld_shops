import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/model/category.dart';
import '../../service/service_method.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import '../../model/categoryGoodsList.dart';
import '../../provide/child_category.dart';
import '../../provide/category_goods_list.dart';
//右侧导航菜单
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCategory>(
        builder: (context, child, val) {


          if(val.childCategoryList.length > 0){
            return Container(
              height: ScreenUtil.getInstance().setHeight(80),
              width: ScreenUtil.getInstance().setWidth(570),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ))),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: val.childCategoryList.length,
                  itemBuilder: (context, index) {
                    return _rightInkWell(
                        context, index, val.childCategoryList[index]);
                  }),
            );
          }else{
            return Text(
              '666'
            );
          }

        },
      ),
    );
  }
}

Widget _rightInkWell(BuildContext context, int index, BxMallSubDto item) {
  bool isCheck = false;
  isCheck = (index == Provide.value<ChildCategory>(context).childIndex)
      ? true
      : false;
  return InkWell(
    onTap: () {
      Provide.value<ChildCategory>(context)
          .changeChildIndex(index, item.mallSubId);
      _getGoodList(context, item.mallSubId);
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Text(
        item.mallSubName,
        style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(28),
            color: isCheck ? Colors.pink : Colors.black),
      ),
    ),
  );
}

//得到商品列表数据
_getGoodList(context, String categorySubId) {
  var data = {
    'categoryId': Provide.value<ChildCategory>(context).categoryId,
    'categorySubId': categorySubId,
    'page': 1
  };
  ldRequest('mainUrl', formData22: '''getMallGoods?categoryId=
                ${Provide.value<ChildCategory>(context).categoryId}
                &categorySubId=${categorySubId}
                &page=1''').then((val) {
    var data = json.decode(val.toString());



    CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
    if (goodsList.data == null) {
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
    } else {
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);
    }
  });
}


//