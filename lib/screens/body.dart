import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/main_screen/category.dart';
import 'package:myTestApp_Test/screens/main_screen/home.dart';
import 'package:myTestApp_Test/screens/main_screen/menu.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String title;
  int _selectPage = 0;
  List<Widget> controller = List<Widget>();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  Widget _buildBody(){
    return PageView(
      controller: pageController,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Home(pageIndex: _selectPage, title: "Home", pageInfo: _bodyNaviBar),
        Menu(pageIndex: _selectPage, title: "Menu", pageInfo: _bodyNaviBar),
        Category(pageIndex: _selectPage, title: "Category", pageInfo: _bodyNaviBar)
      ], onPageChanged: (page) => setState((){ _selectPage = page; })
    );
  }

  List<BottomNavigationBarItem> _bodyNaviBarItem(){
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        // label: "Home",
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        // label: "Home",
        title: Text("Menu"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text("Category"),
      ),
    ];
  }

  Widget _bodyNaviBar(BuildContext context){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => tapBottom(index),
      currentIndex: _selectPage,
      items: _bodyNaviBarItem(),
      iconSize: 45,
      selectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor
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
      body: _buildBody(),
      bottomNavigationBar: _bodyNaviBar(context),
    );
  }
}