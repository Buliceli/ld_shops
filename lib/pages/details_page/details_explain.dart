import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DetailsExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().
      setWidth(750),
      //height: ScreenUtil.getInstance().setHeight(90),
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(15),
      child: Text(
        '说明:  >极速送达 >正品保障',
        style: TextStyle(
          color: Colors.red,
          fontSize:
          ScreenUtil.getInstance().setSp(32),
        ),

      ),
    );
  }
}
