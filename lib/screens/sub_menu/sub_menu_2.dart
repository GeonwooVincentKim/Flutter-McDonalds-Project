import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_main_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/list_tile/submenu_list_tile.dart';
import 'package:provider/provider.dart';


class SubMenu extends StatefulWidget {
  // final String title;
  // final int pageIndex;
  final Color menuColor;
  final String menuID;
  // MenuModel menuTypes;

  SubMenu({
    // @required this.title,
    // @required this.pageIndex,
    @required this.menuColor,
    @required this.menuID
  });

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  MainMenuModel mainTypes;
  List<MenuModel> subMenu = [];

  @override
  void initState(){
    mainTypes = Provider.of<MainMenuProvider>(context, listen: false).menu;

    if(mainTypes == null){
      final List<MainMenuModel> mainTitle = Provider.of<MainMenuProvider>(context, listen: false).mainMenuItems.toList();
      // widget.mainTypes = mainTitle.first;
      mainTypes = mainTitle.firstWhere((submenu) => submenu.id == widget.menuID);
      // subMenu[0] = mainTypes.id;

    }
    super.initState();
  }
  
  Widget _buildSubMenuAppBar(){
    return AppBar(
      title: Text(mainTypes.foodName),
      centerTitle: true,
      backgroundColor: widget.menuColor,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iadd,
            color: Colors.white
          ), onPressed: () => Navigator.pushNamed(context, "/createMenu"),
        )
      ],
    );
  }

  void _buildMenuType(){
    
  }

  Widget _buildSubMenuBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: SingleChildScrollView(
        child: Consumer<MenuProvider>(
          builder: (context, submenuPage, child){
            MainMenuModel mainMenu = Provider.of<MainMenuProvider>(context, listen: false).menu;
            List<MenuModel> subMenuList = [];
            
            // subMenuList = submenuPage.subMenuItems.where((menuList) => mainMenu.type == ).toList();
            if(mainMenu.id == 'ham'){
              subMenuList = submenuPage.subMenuItems;
            }else if (mainMenu.id == 'dessert' ){
              subMenuList = submenuPage.dessertItems;
            }else if (mainMenu.id == 'cafe'){
              subMenuList = submenuPage.cafeItems;
            }else if(mainMenu.id == 'morning'){
              subMenuList = submenuPage.morningItems;
            }
            else if(mainMenu.id == Provider.of<MainMenuProvider>(context, listen: false).menu.id){
              subMenuList = submenuPage.subMenuItems.where((subMenu)=>subMenu.id == Provider.of<MainMenuProvider>(context, listen: false).menu.id);
            }
            // subMenu = subMenuList.where((subMenu)=> subMenu.id == )
            subMenu = subMenuList.toList();

            return GridView.builder(
              shrinkWrap: true,
              itemCount: subMenu.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0,
              ),
              physics: ScrollPhysics(),
              itemBuilder: (context, index) => SubMenuTile(subMenu: subMenuList[index]) ,
            );
          }
        )
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSubMenuAppBar(),
      drawer: SideMenu(),
      body: _buildSubMenuBody(),
      backgroundColor: BasicBackgroundColor,
    );
  }
}