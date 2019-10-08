import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import '../../provide/currentIndex.dart';
import '../../provide/cart.dart';
class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodInfo = Provide.value<DetailsInfoProvide>(context)
        .goodsModel.data.goodInfo;
    var goodsID = goodInfo.goodsId;
    var goodsName = goodInfo.goodsName;
    var count = 1;
    var price = goodInfo.presentPrice;
    var images = goodInfo.image1;

    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      color: Colors.white,
      height: ScreenUtil.getInstance().setHeight(80),

      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red,
                  ),
                ),
              ),

              Provide<CartProvide>(
                builder: (context,child,val){
                  int goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                  return Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          border: Border.all(width: 2,color: Colors.white),
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text(
                        '${goodsCount}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(22)
                        ),
                      ),
                    ),
                  );
                },
              ),


            ],
          ),
          InkWell(
            onTap: () async {
              await Provide.value<CartProvide>(context).save(
                  goodsID,
                  goodsName,
                  count,
                  price,
                  images
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil.getInstance().setWidth(320),
              height: ScreenUtil.getInstance().setHeight(80),
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(28),
                ),
              ),
            ),

          ),
          InkWell(
            onTap: ()async {
              await Provide.value<CartProvide>(context).remove();

            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.red,
              child: Text(
                '马上购买',
                style: TextStyle(color: Colors.white,
                    fontSize: ScreenUtil().setSp(28)),
              ),
            ) ,

          ),



        ],
      ),


    );
  }
}
