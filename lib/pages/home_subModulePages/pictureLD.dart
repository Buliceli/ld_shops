import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class PicturePage extends StatelessWidget {
  final String picURL;
  PicturePage({this.picURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(picURL),
    );
  }
}


class PicBottomPage extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;
  PicBottomPage({this.leaderImage,this.leaderPhone});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){},
        child: Image.network(leaderImage),

      ),
    );
  }

//  void _lauchURL() async{
//    String url = 'tel:' + leaderPhone;
//    if(await canLaunch(url)){
//      await launch(url);
//    }else{
//      throw 'Could not launch $url';
//    }
//  }
}
