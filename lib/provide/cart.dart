import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cartInfo.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {
  String cartString = '[]';

  //商品列表对象
  List<CartInfoModel> cartList = [];

  //总价格
  double allPrice = 0;

  //商品总数量
  int allGoodsCount = 0;

  //是否全选
  bool isAllCheck = true;

  //----------往购物车中增加商品---------------
  save(goodsId,goodsName,count,price,images) async {
    //初始化 SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo');  //获取持久化存储的值
    var temp=cartString==null?[]:json.decode(cartString.toString());
    //把获得值转变成List
    List<Map> tempList= (temp as List).cast();
    //声明变量 用于判断购物车中是否已经存在此商品ID

    var isHave = false;
    //用于循环索引使用
    int ival = 0;
    allPrice = 0;
    allGoodsCount = 0;

    tempList.forEach((item){
      if(goodsId == item['goodsId']){
         tempList[ival]['count'] = item['count'] + 1;
         cartList[ival].count ++;
         isHave = true;
      }
      if(item['isCheck']){
        allPrice += (cartList[ival].price * cartList[ival].count);
        allGoodsCount += cartList[ival].count;
      }
      ival++;
    });

    if(!isHave){
      //如果没有 进行增加
      Map<String,dynamic> newGoods = {
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images,
        'isCheck':true //是否已经选择
      };
      tempList.add(newGoods);
      cartList.add(CartInfoModel.fromJson(newGoods));
      allPrice+= (count * price);
      allGoodsCount += count;
    }
    //把字符串进行encode操作 //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //我从前有一个朋友和你一样的叼
    cartString = json.encode(tempList).toString();
    //如今坟头上的草已经有一丈五了
    print('我现在把json字符串持久化存储的 我要存储的json字符串长下面👇这样');
    print(cartString);
    print('+++++++++++++++++++++++++++++++++++');
    //进行持久化
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }




//----------删除购物车中的商品---------------
    remove()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.remove('cartInfo');
     cartList = [];
     allGoodsCount = 0;
     allPrice = 0;
     print('清空购物车');
     notifyListeners();
    }

//-----------得到购物车中的商品--------------
   getCartInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获得购物车中的商品 这时候是一个字符串
     cartString = prefs.getString('cartInfo');
     //把cartList初始化 防止数据混乱
     cartList = [];
     //判断得到的字符串是否有值
     //不判断会报错
     if(cartString == null){
       cartList = [];
     }else{
       List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
       allPrice = 0;
       allGoodsCount = 0;
       isAllCheck = true;
       tempList.forEach((item){
         if(item['isCheck']){
           allPrice += (item['count'] * item['price']);
           allGoodsCount += item['count'];
         }else{
           isAllCheck = false;
         }

         cartList.add(CartInfoModel.fromJson(item));
       });
     }

     print('得到购物车里的所有商品');
     print(cartList);
     print('-------------------');
     notifyListeners();
   }
//-----------删除单个购物车商品--------------
deleteOneGoods(String goodsId) async{
    SharedPreferences pres = await SharedPreferences.getInstance();
    cartString = pres.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int delIndex = 0;
    tempList.map((item){
      if(item['goodsId'] == goodsId){
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    pres.setString('cartInfo', cartString);
    //删除之后 重新刷新一下购物车数据
  await getCartInfo();
}
//-----------修改选中状态--------------
changeCheckState(CartInfoModel cartItem) async{
    SharedPreferences pres = await SharedPreferences.getInstance();
    cartString = pres.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex ++;
    });
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    pres.setString('cartInfo', cartString);

    await getCartInfo();
}


   //修改选中状态
//  changeCheckState(CartInfoMode cartItem) async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     cartString=prefs.getString('cartInfo');
//     List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
//     int tempIndex =0;
//     int changeIndex=0;
//     tempList.forEach((item){
//
//         if(item['goodsId']==cartItem.goodsId){
//          changeIndex=tempIndex;
//         }
//         tempIndex++;
//     });
//     tempList[changeIndex]=cartItem.toJson();
//     cartString= json.encode(tempList).toString();
//     prefs.setString('cartInfo', cartString);//
//     await getCartInfo();
//
//  }

//-----------点击了全选按钮的操作--------------
changeAllCheckBtnState(bool isCheck) async{
    SharedPreferences pres = await SharedPreferences.getInstance();
    cartString = pres.getString('cartInfo');
    List<Map> temList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    for(var item in temList){
      var newItem = item;
      newItem['isCheck'] = isCheck;
      newList.add(newItem);
    }
    cartString = json.encode(newList).toString();
    pres.setString('cartInfo', cartString);
    await getCartInfo();
}

//-------------增加减少数量的操作----------------------
addOrReduceAction(var cartItem,String todo) async{
    SharedPreferences pres = await SharedPreferences.getInstance();
    cartString = pres.getString('cartInfo');
    List<Map> temList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    temList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex ++;
    });
    if(todo == 'add'){
      cartItem.count ++;
    }else if(cartItem.count > 1){
      cartItem.count --;
    }

    temList[changeIndex] = cartItem.toJson();
    cartString = json.encode(temList).toString();
    pres.setString('cartInfo', cartString);
    await getCartInfo();
}
}
