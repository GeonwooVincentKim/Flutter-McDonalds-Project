import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class ImageCropCircle extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  MenuModel menu;

  ImageCropCircle({
    this.width,
    this.height,
    this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circularSize),
      child: Container(
        width: imageWidth,
        height: imageHeight,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover
        ),
      ),
    );
  }
}