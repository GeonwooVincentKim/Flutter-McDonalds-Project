import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class ContentDetails extends StatelessWidget{
  final String ctxTitle;
  final String ctxContents;

  ContentDetails({@required this.ctxTitle, @required this.ctxContents});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "$ctxTitle: ".toUpperCase(),
            style: settingsText,
          ),
          TextSpan(
            text: "$ctxContents",
            style: subSettingsText,
          )
        ]
      )
    );
  }
}