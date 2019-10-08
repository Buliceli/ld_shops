import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/model/hotGoodsModel.dart';
import 'package:provide/provide.dart';


//import 'provide/hotGoodsProvide.dart';
//import '../model/hotGoodsModel.dart';


class HotPage extends StatelessWidget {
  final List<Map> newGoodsList;

  HotPage({this.newGoodsList});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TopTitle(),
         // BottomView()
          BottomView()
        ],
      ),
    );
  }
}

class BottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HotGoodsModel>(
      builder: (context,child,val){
        print('--------------------');
        print(child);
        print(val);
        print('++++++++++++++++++++');
        return Container(

        );
      },
    );
  }
}



class TopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.whatshot,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                '火爆专区',
                style: TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
            )
          ],
        ));
  }
}
