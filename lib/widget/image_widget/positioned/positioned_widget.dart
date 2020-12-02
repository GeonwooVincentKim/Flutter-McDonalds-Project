import 'package:flutter/material.dart';
import 'package:myTestApp/widget/button/bottom_button.dart';


class PositionedWidget extends StatelessWidget{
  final double bottom;
  final double right;
  final double height;
  final double width;
  final double left;
  final double top;

  final String contents;
  final Function onPressed;
  final Widget child;

  PositionedWidget({
    this.bottom,
    this.right,
    this.height,
    this.width,
    this.left,
    this.top,

    this.child,
    @required this.contents,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      height: height,
      width: width,
      left: left,
      top: top,
      child: BottomButton(
        onPressed: onPressed,
        contents: contents,
        child: child
      ),
    );
  }
}