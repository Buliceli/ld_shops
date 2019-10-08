import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';
import 'category_page.dart';
import 'member_page.dart';
import 'cart_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: this._currentIndex,
    );
  }
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('会员中心')
    )
  ];
  final List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('分类')
    ),

    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text('购物车')
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('会员中心')
    )
  ];
  final List<Widget> tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),

      body: PageView(
        controller: _pageController,
        children: this.tabPages,
        onPageChanged: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },
      ),


      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(this._currentIndex);
          });
        },
        items:bottoms,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepPurple,

      ),
    );
  }
}



