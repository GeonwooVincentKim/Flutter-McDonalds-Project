import 'package:flutter/material.dart';
import 'package:myTestApp/screens/menu/home.dart';
import 'package:myTestApp/screens/menu/menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/screens/menu/cart.dart';
import 'package:myTestApp/shared/style/style.dart';


class PageSlider extends StatefulWidget {
  @override
  _PageSliderState createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  String title;
  int _selectPage = 0;
  List<Widget> controller = List<Widget>();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  Widget _homeBody(){
    return PageView(
      controller: pageController,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Home(pageIndex: _selectPage, title: "Home", pageInfo: _homeNaviBar, homeColor: BasicAppBarColor,),
        Menu(pageIndex: _selectPage, title: "Menu", pageInfo: _homeNaviBar, menuColor: BasicAppBarColor,),
        // Cart(pageIndex: _selectPage, title: "Cart", pageInfo: _homeNaviBar, cartColor: BasicAppBarColor,),
      ],
      onPageChanged: (page){ setState((){ _selectPage = page;}); },
    );
  }
  
  List<BottomNavigationBarItem> _homeNaviBarItem(){
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        title: Text("Menu")
        // label: "Menu", // Show the Menu that is empty, or not empty menu that the User ordered.
      ),
    ];
  }

  Widget _homeNaviBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => tapBottom(index),
      currentIndex: _selectPage,
      items: _homeNaviBarItem(),
      iconSize: 45,
      selectedItemColor: Colors.white,
      backgroundColor: BasicAppBarColor,
    );
  }

  void tapBottom(int index){
    setState(() {
      _selectPage = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: _homeBody(),
      bottomNavigationBar: _homeNaviBar(),
    );
  }
  
}