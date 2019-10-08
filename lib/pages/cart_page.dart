import 'package:flutter/material.dart';
import 'package:flutter_ld_shops/pages/cart_page/cart_bottom.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';
import 'cart_page/cart_item.dart';
import 'cart_page/cart_bottom.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '购物车'
        ),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context,snap){
          List cartList = Provide.value<CartProvide>(context).cartList;

          print('现在整个购物车都清空了 ....');
          print(cartList);
          print(cartList.length);
          print('++++++++++++++');
         if(snap.hasData && cartList != null && cartList.length > 0){
           return Stack(
             children: <Widget>[
               Provide<CartProvide>(
                 builder: (context,child,childCategory){
                   cartList = Provide.value<CartProvide>(context).cartList;
                   if(cartList.length == 0){
                     return Container(
                       child: Center(
                         child: Text(
                           '666'
                         ),
                       ),
                     );
                   }else{

                   return ListView.builder(
                      itemCount: cartList.length,
                       itemBuilder: (context,index){
                      return  CartItem(cartList[index]);
                       }
                   );
                 }}

               ),
               Positioned(
                 bottom: 0,
                 left: 0,
                 child: CartBottom(),
               )
             ],
           );
         }else{
           return Text('正在加载');
         }
       },
      )
    );
  }

  Future<String> _getCartInfo(context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
