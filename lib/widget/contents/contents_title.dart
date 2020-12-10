import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/contents/contents_detail.dart';


class ContentsTitle extends StatelessWidget{
  final String ctxTitle;
  final String ctxContents;
  final double marginBottom;

  ContentsTitle({
    @required this.ctxTitle,
    @required this.ctxContents,
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