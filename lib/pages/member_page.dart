import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        '会员中心'
      ),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //top
            TopCom(),
            //middle
            MiddleCom(text: '我的订单',icon: Icons.list,),
            //bottom
            BottomCom(),
            //tab
            BottomNext()
          ],
        ),
      ),
    );

  }
}

class BottomNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        children: <Widget>[
          MiddleCom(text: '领取优惠券',icon: Icons.android,),
          MiddleCom(text: '已领取优惠券',icon: Icons.invert_colors_off,),
          MiddleCom(text: '地址管理',icon: Icons.import_contacts,),
          MiddleCom(text: '客服电话',icon: Icons.ac_unit,),
          MiddleCom(text: '意见反馈',icon: Icons.hot_tub,),
          MiddleCom(text: '评价订单',icon: Icons.account_balance_wallet,),
          MiddleCom(text: '关于我们',icon: Icons.blur_linear,),
        ],
      ),
    );
  }
}


class MiddleCom extends StatelessWidget {
  final String text;
  IconData icon;
  MiddleCom({this.text,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Icon(icon),
          ),
          Expanded(
            flex: 8,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.chevron_right
            ),
          )
        ],
      ),
      height: ScreenUtil.getInstance().setHeight(88),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black45
          )
        )

        
      ),
    );
  }
}


class BottomCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 15,bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.photo_camera),
                SizedBox(height: 4,),
                Text('待付款',
                style: TextStyle(

                ),)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.call),
                SizedBox(height: 4,),
                Text('待发货')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.directions_car),
                SizedBox(height: 4,),
                Text('待收货')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.content_paste),
                SizedBox(height: 4,),
                Text('待评价')
              ],
            ),
          ),

        ],
      ),
    );
  }
}


class TopCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Stack(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color:
              Colors.deepOrangeAccent,
              height: 200,
            ),
          )
          ,
          Positioned(
            left: MediaQuery.of(context).size.width * 0.5 - 100,
            top: -5,
            child: Column(
              children: <Widget>[
                Container(

                  child: Image.asset('images/777.gif'),
                  width: 200,
                  height: 140,
                  //color: Colors.white,
                )
                ,
                Text('LD',style: TextStyle(
                  fontSize: 17
                ),)
              ],
            ),
          )
        ],

      ),
    );
  }
}


class BottomClipper extends CustomClipper<Path>
{
  @override
  getClip(Size size) {
    // TODO: implement getClip

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 70);

    var firstControlPoint =
    Offset(size.width / 2,size.height);
    var firstEndPoint =
    Offset(size.width,size.height - 70);


    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy
    );

    path.lineTo(size.width,
        size.height - 70);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper)
  {
    // TODO: implement shouldReclip
    return false;
  }

}