import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(

      builder: (context,child,val){
        var details = Provide.value<DetailsInfoProvide>(context)
            .goodsModel.data.goodInfo.goodsDetail;
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if(isLeft){
          return Container(
            child: Html(
              data: details,
            ),
          );
        }else{
          return Container(
            width: ScreenUtil.getInstance().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('暂无数据'),
          );
        }
      },
    );
  }
}
