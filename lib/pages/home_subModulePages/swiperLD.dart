import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ld_shops/routers/application.dart';
class SwiperPage extends StatelessWidget {
  final List<Map> swiperDataList;
  SwiperPage({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              print(this.swiperDataList);

              Application.router.navigateTo(context, "/detail?id=${swiperDataList[index]['goodsId']}");
              print(
                  '''点击了轮播图的第${index}张
                   它对应的goodsId为${swiperDataList[index]['goodsId']}
                   ''');
            },
            child: Image.network(
              '${swiperDataList[index]['image']}',
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        //control: new SwiperControl(),
      ),
    );
  }
}
