import 'package:flutter/material.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/image_widget/image_crop.dart';


class PositionedImage extends StatelessWidget {
  final double bottom;
  final double right;
  final double height;
  final double width;
  final double left;
  final int selection;
  final String imagePath;

  PositionedImage({
    this.bottom,
    this.right,
    this.height,
    this.width,
    this.left,
    @required this.selection,
    this.imagePath,
  });
  
  @override
  Widget build(BuildContext context) {

    return Positioned(
      bottom: bottom,
      right: right,
      height: height,
      width: width,
      left: left,
      child: selection != 0 ?
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            color: BasicCircleColor,
            shape: BoxShape.circle
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(circularSize),
          )
        ) : 
        ImageCropCircle(
          width: width,
          height: height,
          imagePath: imagePath,
        )
    );
  }
}