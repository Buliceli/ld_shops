import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import '../../provide/cart.dart';


class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      width: ScreenUtil.getInstance().setWidth(750),

      child: Provide<CartProvide>(
        builder: (context,child,childCategory){
          return Row(
            children: <Widget>[
              _selectedAllButton(context),
              _allPriceArea(context),
              _goButton(context),
            ],
          );
        },
      ),
    );
  }
  //全选按钮
  Widget _selectedAllButton(context){
      bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
      return Container(
        child: Row(
          children: <Widget>[
            Checkbox(
              value: isAllCheck,
              activeColor: Colors.pink,
              onChanged: (bool val){
                Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
              },
            ),
            Text(
              '全选'
            )
          ],
        ),
      );
  }
  //合计区域
  Widget _allPriceArea(context){
    double allPrice = Provide.value<CartProvide>(context).allPrice;

    return Container(
      width: ScreenUtil.getInstance().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil.getInstance().setWidth(280),
                child: Text(
                  '合计:',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(36)
                  ),
                      
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil.getInstance().setWidth(150),
                child: Text(
                  '¥${allPrice}',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(36)
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费,预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil.getInstance().setSp(22)
              ),
            ),
          )
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(context){
    int allGoodsCount = Provide.value<CartProvide>(context)
        .allGoodsCount;

    return Container(
      width: ScreenUtil.getInstance().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(
              color: Colors.white,

            ),
          ),
        ),
      ),
    );
  }













}

















