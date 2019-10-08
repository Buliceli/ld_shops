import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/service/service_method.dart';
import 'package:provide/provide.dart';
import '../../model/category.dart';
import '../../model/categoryGoodsList.dart';
import '../../provide/child_category.dart';
import '../../provide/category_goods_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];

  //索引
  var listIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    print('初始化');
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, val) {
        _getGoodList(context);
        listIndex = val.categoryIndex;
        return Container(
          width: ScreenUtil.getInstance().setWidth(180),
          decoration: BoxDecoration(
              border:
                  Border(right: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _leftInkWell(index);
              }),
        );
      },
    );
  }

  Widget _leftInkWell(index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context).changeCategory(categoryId, index);
        Provide.value<ChildCategory>(context).getChildCategory(childList, categoryId);
        _getGoodList(context,categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(100),
        padding: EdgeInsets.only(left: 10,top: 20),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 238, 239, 1.0):Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(28),
          ),
        ),
      ),

    );
  }

  //得到后台大类数据 // http://baixingliangfan.cn/baixing/bxAppIndex/getCategory
  _getCategory() async {
    await ldRequest('', formData22: 'getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      //大类ID默认为4
      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto, '4');
    });
  }

  //得到商品列表数据
  void _getGoodList(context, {String categoryId}) {
    ldRequest('mainUrl', formData22: '''getMallGoods?categoryId=${categoryId == null ? Provide.value<ChildCategory>(context).categoryId : categoryId}&categorySubId=${Provide.value<ChildCategory>(context).subId}&page=1''').then((val) {
      var data = json.decode(val.toString());
CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);

    });
  }
}

//http://baixingliangfan.cn/baixing/bxAppIndex/getMallGoods?categoryId=2c9f6c946cd22d7b016cd732f0f6002f&categorySubId=&page=1
//http://webapi.amap.com/count?type=f&k=b928972782be0e082dc70fa7bc386d11&u=file%253A%252F%252F%252Fvar%252Fcontainers%252FBundle%252FApplication%252F2733F436-2668-408D-AF1F-263E984A8E66%252FUZApp.app%252Fwidget%252Findex.html&m=1&pf=ios&methods=ev,a&methodsParams=&options=&optionsValue=&cbk=jsonp_498045_&csid=B550C341-E36D-4948-BBCB-4938FE4E6384
