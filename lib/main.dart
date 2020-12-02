import 'package:flutter/material.dart';
import 'package:myTestApp/screens/body.dart';
import 'package:provider/provider.dart';


void main() => runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
        title: "McDonaldsApp",
        initialRoute: "/",
        routes: {
          "/": (context) => Body(),
        },
        onGenerateRoute: (settings) {
          final List<String> pathElements = settings.name.split("/");
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'food'){
            String foodID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => myApp());
          }else if(pathElements[1] == 'detail'){
            String foodID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => myApp());
          }else if(pathElements[1] == 'filter'){
            // return MaterialPageRoute(builder: (BuildContext context) => FilterPage(settings.arguments));
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (BuildContext context) => myApp());
        },
      ),
    );
  }
}