import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_menu.dart';
import 'package:myTestApp_Test/widget/image_widget/positioned/positioned_image.dart';
import 'package:provider/provider.dart';


class CartList extends StatelessWidget{
  final FoodModel orderMenu;
  CartList({@required this.orderMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/details/${orderMenu.id}"),
        child: Container(
          child: Dismissible(
            key: UniqueKey(),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.2,
              secondaryActions: [
                IconSlideAction(
                  caption: "Delete",
                  icon: Icons.delete,
                  closeOnTap: false,
                  onTap: () => Provider.of<ProviderMenu>(context, listen: false).deleteCartMenu(orderMenu)
                ),
              ],
              child: Container(
                color: Theme.of(context).canvasColor,
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
}