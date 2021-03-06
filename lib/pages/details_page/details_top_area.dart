import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
        var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsModel.data.goodInfo;
        if(goodsInfo != null){
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2),
            child: Column(
              children: <Widget>[

                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName ),
                _goodsNum(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.presentPrice,goodsInfo.oriPrice),


              ],
            ),
          );
        }else{
          return Text(
            '正在加载中 详情页 Top hahah'
          );
        }
      },
    );
  }

  //商品图片
Widget _goodsImage(url){
    return Image.network(
        url,
        width: ScreenUtil.getInstance().setWidth(740),
    );
}
//商品名称
Widget _goodsName(name){
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(30)
        ),
      ),
    );
}
//商品编号
Widget _goodsNum(num){
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '编号:${num}',
        style: TextStyle(
          color: Colors.black26
        ),
      ),
    );
}
//商品价格
Widget _goodsPrice(presentPrice,oldPrice){
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Text(
            '¥${presentPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil.getInstance().setSp(40),
            ),
          ),
          Text(
            '市场价:¥${oldPrice}',
            style: TextStyle(
              color: Colors.black26,
              fontSize: ScreenUtil.getInstance().setSp(40),
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
}
}








































