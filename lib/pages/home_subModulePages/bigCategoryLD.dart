import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/routers/application.dart';

class FloorTitle extends StatelessWidget {
  final String picture_addres;
  FloorTitle({this.picture_addres});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(picture_addres),
    );
  }
}
class FloorContent extends StatelessWidget {
  final List floorGoods;
  FloorContent({this.floorGoods});
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Row(
       children: <Widget>[
         Column(
           children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width * 0.5,
               height: 300,
              // color: Colors.red,
               child: Column(
                 children: <Widget>[
                   Container(
                     height: 200,
                     color: Colors.yellow,
                     child: InkWell(
                       onTap: (){
Application.router.navigateTo(context, '/detail?id=${floorGoods[0]['goodsId']}');
                       },
                       child: Image.network(
                         floorGoods[0]['image'],
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                   Container(
                     height: 100,
                     color: Colors.purpleAccent,
                     child: InkWell(
                       onTap: (){
                         Application.router.navigateTo(context, '/detail?id=${floorGoods[3]['goodsId']}');

                       },
                       child: Image.network(
                         floorGoods[3]['image'],
                         fit: BoxFit.fill,
                       ),
                     ),
                   )
                 ],
               ),

             )
           ],
         ),
         Column(
           children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width * 0.5,
               height: 300,
              // color: Colors.yellow,
               child: Column(
                 children: <Widget>[
                   Container(
                     height: 100,
                     color: Colors.green,
                     child: InkWell(
                       onTap: (){
                         Application.router.navigateTo(context, '/detail?id=${floorGoods[1]['goodsId']}');

                       },
                       child: Image.network(floorGoods[1]['image'],fit: BoxFit.fill,),
                     ),
                   ),
                   Container(
                     height: 100,
                     color: Colors.yellow,
                     child: InkWell(
                       onTap: (){
                         Application.router.navigateTo(context, '/detail?id=${floorGoods[2]['goodsId']}');

                       },
                       child: Image.network(floorGoods[2]['image'],fit: BoxFit.fill,),
                     ),
                   ),
                   Container(
                     height: 100,
                     color: Colors.blue,
                     child: InkWell(
                       onTap: (){
                         Application.router.navigateTo(context, '/detail?id=${floorGoods[4]['goodsId']}');

                       },
                       child: Image.network(floorGoods[4]['image'],fit: BoxFit.fill,),
                     ),
                   )
                 ],
               ),
             )
           ],
         )
       ],
     ),
    );
  }


}

