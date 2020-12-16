import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class ContentsCart extends StatelessWidget{
  final String title;
  ContentsCart({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(title.toUpperCase(), style: menuTitleSize),
      ),
    );
  }
}