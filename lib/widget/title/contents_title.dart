import 'package:flutter/material.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/title/contents_details.dart';


class ContentsTitle extends StatelessWidget{
  final String ctxTitle;
  final String ctxContents;
  final Color ctxColor;
  final double marginBottom;

  ContentsTitle({
    @required this.ctxTitle,
    @required this.ctxContents,
    this.ctxColor = CartOrderColor,
    this.marginBottom = basicPadding / 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentDetails(
          ctxTitle: ctxTitle,
          ctxContents: ctxContents,
        ),
        SizedBox(height: marginBottom),
      ],
    );
  }
}