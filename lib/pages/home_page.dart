import 'dart:convert';
import '../routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/config/service_url.dart';
import '../service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//六大模块分别对应的UI
import 'home_subModulePages/swiperLD.dart';
import 'home_subModulePages/bannerLD.dart';
import 'home_subModulePages/pictureLD.dart';
import 'home_subModulePages/recommendLD.dart';
import 'home_subModulePages/bigCategoryLD.dart';

//火爆专区
import 'home_subModulePages/hotGoodsLD.dart';

//数据模型
import 'package:provide/provide.dart';
import '../provide/hotGoodsProvide.dart';
import '../model/hotGoodsModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var formData = {'lon': '115.075234375&', 'lat': '35.776455078125'};
  int page = 1;
  List hotGoodsList = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: ldRequest(
            'http://baixingliangfan.cn/baixing/bxAppIndex/getHomePageContent',
            formData22:
                'getHomePageContent?lon=115.075234375&lat=35.776455078125'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //取出响应的数据
            var data = json.decode(snapshot.data.toString());
            //print(data);
            //轮播图区域数据
            List<Map> swiperDataList = (data['data']['slides'] as List).cast();
           // print('轮播图的数据有错??');
//          //  print(swiperDataList);
            swiperDataList = [{'image': 'https://images.baixingliangfan.cn/advertesPicture/20190923/20190923161037_4089.jpg', 'urlType': 0, 'goodsId': 'c9248599b4a1467fb0a485e60486c97e'},
          {'image': 'https://images.baixingliangfan.cn/advertesPicture/20190923/20190923161037_4089.jpg', 'urlType': 0, 'goodsId': 'c9248599b4a1467fb0a485e60486c97e'},];
            //banner区域数据
            List<Map> bannerList = (data['data']['category'] as List).cast();
            //图片展示区域数据
            //广告图片
            String advertesPicture =
                data['data']['advertesPicture']['PICTURE_ADDRESS'];
            //店长图片
            String leaderImage = data['data']['shopInfo']['leaderImage'];
            //店长电话
            String leaderPhone = data['data']['shopInfo']['leaderPhone'];
            //商品推荐区域数据
            List<Map> recommendList =
                (data['data']['recommend'] as List).cast();
            //大分类 区域1 潮流酱酒
            //标题1图片
            String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS'];
            //标题1的商品和图片
            List<Map> floor1 = (data['data']['floor1'] as List).cast();

            //大分类 区域2 经典浓香
            //标题2图片
            String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS'];
            //标题2的商品和图片
            List<Map> floor2 = (data['data']['floor2'] as List).cast();

            //大分类 区域3 品味清香
            //标题2图片
            String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS'];
            //标题2的商品和图片
            List<Map> floor3 = (data['data']['floor3'] as List).cast();

            return EasyRefresh(
              child: ListView(
                children: <Widget>[
                  //轮播图组件
                  SwiperPage(
                    swiperDataList: swiperDataList,
                  ),
                  //banner组件
                  BannerPage(
                    bannerListData: bannerList,
                  ),
                  //图片区域
                  PicturePage(
                    picURL: advertesPicture,
                  ),
                  PicBottomPage(
                    leaderImage: leaderImage,
                    leaderPhone: leaderPhone,
                  ),
                  //推荐区域
                  RecommendPage(
                    recommendListData: recommendList,
                  ),
                  //大分类一
                  FloorTitle(picture_addres: floor1Title),
                  FloorContent(
                    floorGoods: floor1,
                  ),

                  //大分类二
                  FloorTitle(picture_addres: floor2Title),
                  FloorContent(
                    floorGoods: floor2,
                  ),

                  //大分类三
                  FloorTitle(picture_addres: floor3Title),
                  FloorContent(
                    floorGoods: floor3,
                  ),
                  //火爆专区
                  //HotPage(),
                  _hotGoods()
                ],
              ),
              onLoad: () async {
                print('开始加载更多');
                var formPage = {'page': page};
                await ldRequest(homePageBelowConten,
                        formData22: 'getHomePageBelowConten?page=${page}')
                    .then((val) {
                  var data = json.decode(val.toString());
                  HotGoodsModel models = HotGoodsModel.fromJson(data);
                  List list = models.data;
                  print('-------------');
                  print(list);

                  print('+++++++++++++');
                  setState(() {
                    page++;
                    hotGoodsList.addAll(list);
                  });


                });
              },
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    );
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding:EdgeInsets.all(5.0),
    alignment:Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border:Border(
            bottom: BorderSide(width:0.5 ,color:Colors.black12)
        )
    ),
    child: Text('火爆专区'),
  );
  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()

        ],
      ),
    );
  }
  Widget _wrapList(){
    if(hotGoodsList.length!= 0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){
            Application.router.navigateTo(context, '/detail?id=${val.goodsId}');

          },
          child: Container(
            width: ScreenUtil.getInstance().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              children: <Widget>[
                Image.network(val.image,width: ScreenUtil.getInstance().setWidth(375),),
                Text(
                  val.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: ScreenUtil.getInstance().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                     // color: Colors.yellow,
                      width: ScreenUtil.getInstance().setWidth(300),
                      alignment: Alignment.center,
                      child: Text(
                          '¥ ${val.price}'
                      ),
                    )

                  ],
                )

              ],
            ),
          ),
        );

      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );

    }else{
      return Text('');
    }
  }

}

