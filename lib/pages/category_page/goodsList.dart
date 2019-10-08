import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_ld_shops/provide/category_goods_list.dart';
import 'package:provide/provide.dart';
import '../../provide/category_goods_list.dart';
import '../../provide/child_category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import '../../model/categoryGoodsList.dart';
import 'package:flutter_ld_shops/service/service_method.dart';
import 'dart:convert';
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, val) {
        try {
          if (Provide.value<ChildCategory>(context).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch (e) {
          print('进入页面第一次初始化:${e}');
        }
        if (val.goodsList != null) {
          return Expanded(
            child: Container(
              width: ScreenUtil.getInstance().setWidth(570),
              child: EasyRefresh(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: val.goodsList.length,
                    itemBuilder: (context, index) {
                      return _ListWidget(context, val.goodsList, index);
                    }),
                onLoad: () async {
                  _getMoreList();
                },
              ),
            ),
          );
        } else {
          return Text('暂时没有数据666');
        }
      },
    );
  }
}

//上拉加载更多
_getMoreList() {
  //得到商品列表数据
  void _getGoodList(context, {String categoryId}) {
    ldRequest('mainUrl', formData22: '''getMallGoods?categoryId=${categoryId == null ? Provide.value<ChildCategory>(context).categoryId : categoryId}&categorySubId=${Provide.value<ChildCategory>(context).subId}&page=1''').then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsList.data);

    });
  }
}

Widget _ListWidget(context, List newList, int index) {
  return InkWell(
    onTap: () {
      Application.router
          .navigateTo(context, '/detail?id=${newList[index].goodsId}');
    },
    child: Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _goodsImage(newList, index),
          Column(
            children: <Widget>[
              _goodsName(newList, index),
              _goodsPrice(newList, index)
            ],
          )
        ],
      ),
    ),
  );
}

Widget _goodsImage(List newList, int index) {
  return Container(
    width: ScreenUtil.getInstance().setWidth(200),
    child: Image.network(newList[index].image),
  );
}

Widget _goodsName(List newList, int index) {
  return Container(
    padding: EdgeInsets.all(5),
    width: ScreenUtil.getInstance().setWidth(370),
    child: Text(
      newList[index].goodsName,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: ScreenUtil.getInstance().setSp(28),
      ),
    ),
  );
}

Widget _goodsPrice(List newList, int index) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    width: ScreenUtil.getInstance().setWidth(370),
    child: Row(
      children: <Widget>[
        Text(
          '价格:¥${newList[index].presentPrice}',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(30)
          ),
        ),
        Text(
          '¥${newList[index].oriPrice}',
          style: TextStyle(
            color: Colors.black26,
            decoration: TextDecoration.lineThrough
          ),
        )
      ],
    ),
  );
}
