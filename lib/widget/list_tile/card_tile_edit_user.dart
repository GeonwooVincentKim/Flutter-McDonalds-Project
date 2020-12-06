import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class CardTile extends StatelessWidget{
  final Color mainColor;
  final Color shadowColor;
  final Widget child;

  CardTile({
    // this.mainColor = BasicBackgroundColor,
    // this.shadowColor = BasicTextColor, 
    this.mainColor,
    this.shadowColor = BasicBackgroundColor,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mainColor,
      shadowColor: shadowColor,
      child: child
    );
  }
}