import 'package:flutter/material.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/shared/style/style.dart';


class CartTitle extends StatelessWidget{
  final String title;
  CartTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(title.toUpperCase(), style: menuTitleSize),
            TransparentDivider(),
          ],
        )
      ),
    );
  }
}