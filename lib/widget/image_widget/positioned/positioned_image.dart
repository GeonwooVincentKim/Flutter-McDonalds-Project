import 'package:flutter/material.dart';
import 'package:myTestApp_Test/provider/provider_theme.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/image_widget/image_crop.dart';
import 'package:provider/provider.dart';


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
      // 0XFFDCE775 (lime[300])
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
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