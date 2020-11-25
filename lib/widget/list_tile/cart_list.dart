import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myTestApp/model/model_menu.dart';
import 'package:myTestApp/providers/provider_menu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/shared/style/text.dart';
import 'package:myTestApp/widget/image_widget/positioned_image.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


class CartList extends StatelessWidget{
  final MenuModel orderMenu;
  CartList({@required this.orderMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Provider.of<MenuProvider>(context, listen: false).selectDetailMenu(orderMenu);
          Navigator.pushNamed(context, "/details/${orderMenu.id}");
        },
        // child: Container(
        //       child: Dismissible(
        //           key: UniqueKey(),
        //           child: _buildTileContent(),
        //           background: _buildSlideLeft(),
        //           secondaryBackground: _buildSlideRight(),
        //           onDismissed: (direction){
        //             // if(direction == DismissDirection.startToEnd){
        //             //   Provider.of<MenuProvider>(context, listen: false).selectGame(game);
        //             //   // Provider.of<GameProvider>(context, listen: false).changeProgression(game, 50);
        //             //   Navigator.pushNamed(context, "/createGame");
        //             //   print("HI");
        //             // }
        //             if (direction == DismissDirection.endToStart){
        //               Provider.of<MenuProvider>(context, listen: false).deleteDetailMenu(orderMenu);
        //               // print(orderMenu);
        //               // print("Yeah"); 
        //             }
        //           },
        //         )
        //     ),
        child: Container(
          child: Dismissible(
            key: UniqueKey(),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.2,
              secondaryActions: [
                IconSlideAction(
                  caption: "Delete",
                  color: Colors.grey.shade300,
                  icon: Icons.delete,
                  closeOnTap: false,
                  onTap: (){
                    print("Testing..");
                    // Toast.show(icon:, context,
                    //   duration: Toast.LENGTH_SHORT, 
                    // );
                    // Provider.of<MenuProvider>(context, listen: false).deleteDetailMenu(orderMenu);
                  }
                ),
              ],
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigoAccent,
                    child: PositionedImage(selection: 0, imagePath: orderMenu.image,),
                    foregroundColor: Colors.white,
                  ),
                  title: Text(orderMenu.menuTitle),
                  subtitle: Text(orderMenu.prices.toString() + " ￦"),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }

  // Widget _buildTileContent(){
  //   return Row(
  //     children: [
  //       Container(
  //         width: 95,
  //         height: 97,
  //         child: ClipRRect(
  //           child: Image.asset(
  //             orderMenu.image,
  //             fit: BoxFit.fitWidth,
  //           )
  //         )
  //       ),
  //       _buildTileText(),
  //     ]
  //   );
  // }

  // Widget _buildSlideLeft(){
  //   return Container(
  //     color: Colors.amber,
  //     alignment: Alignment(-0.9, 0.0),
  //     child: Icon(IconMoon.ipencil, color: Colors.white, size: 30.0),
  //   );
  // }

  // Widget _buildSlideRight(){
  //   return Container(
  //     color: Colors.green,
  //     alignment: Alignment(0.9, 0.0),
  //     child: Icon(IconMoon.icheck2, color: Colors.white, size: 30.0,),
  //   );
  // }

  // Widget _buildTileText(){
  //   return Flexible(
  //     child: Container(
  //       width: 290,
  //       height: 97,
  //       decoration: BoxDecoration(color: Colors.black12),
  //       padding: EdgeInsets.all(basicPadding),
  //       child: Column(
  //         children: [
  //           Text(
  //             orderMenu.menuTitle.toUpperCase(),
  //             overflow: TextOverflow.ellipsis,
  //             style: mainListSize,
  //           ), SizedBox(height: basicPadding / 2),

  //         ],
  //       )
  //     )
  //   );
  // }
}