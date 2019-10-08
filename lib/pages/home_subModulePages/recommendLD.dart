import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RecommendPage extends StatelessWidget {
  final List recommendListData;

  RecommendPage({this.recommendListData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      //padding: EdgeInsets.only(left: 10, top: 10, bottom: 8),
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),

      child: Column(
        children: <Widget>[
          titleWidget(),
           _recommedList(),
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(

        '商品推荐',
        style: TextStyle(

            fontSize: 17,
        color: Colors.purpleAccent
        ),

      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
    );
  }

  Widget _recommedList() {

    return Container(
      height: ScreenUtil.getInstance().setHeight(380),
      child: ListView.builder(
          itemBuilder: (context,index){
            return _item(context,recommendListData[index]);
          },
        itemCount: recommendListData.length,
        scrollDirection: Axis.horizontal,

      ),
    );
  }
}

Widget _item(context,item){
  return InkWell(
    onTap: (){
//      print('商品推荐这个地方拿到的goodsId是不是不对?');
//      print('${item['goodsId']}');
Application.router.navigateTo(context, '/detail?id=${item['goodsId']}');
    },

    child: Container(
      width: ScreenUtil.getInstance().setWidth(280),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Column(
        children: <Widget>[
          Image.network(item['image'],),
          Text(
            '¥ ${item['mallPrice']}'
          ),
          Text(
            '¥ ${item['price']}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey
            ),


          )

        ],
      ),
    ),
  );
}