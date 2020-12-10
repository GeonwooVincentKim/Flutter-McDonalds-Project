import 'package:flutter/material.dart';


class CardTile extends StatelessWidget{
  final Widget child;

  CardTile({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child
    );
  }
}