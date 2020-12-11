import 'package:flutter/material.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';


class NotExist extends StatelessWidget{
  Widget _buildImage(){
    return Container(
      child: Image.asset(
        "assets/basicimages/404.jpg",
        fit: BoxFit.fill
      )
    );
  }

  Widget _buildText(){
    return Container(
      child: Column(
        children: [
          TextDesign(
            basicText: "Congratulations!!",
            textStyle: null
          ),
          Divider(height: basicPadding * 2, color: Colors.transparent),
          TextDesign(
            basicText: "Page does not exist!!!",
            textStyle: null
          )
        ]
      )
    );
  }

  Widget _buildApp(){
    return AppBar(
      title: Text("Page does not exist"),
      centerTitle: true
    );
  }

  Widget _buildBody(BuildContext context){
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.all(basicPadding),
        margin: EdgeInsets.all(basicMargin),
        child: Card(
          child: Column(
            children: [
              _buildImage(),
              _buildText()
            ]
          )
        )
      )
    );
    // return Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height / 2,
    //     padding: EdgeInsets.all(basicPadding),
    //     margin: EdgeInsets.all(basicMargin),
    //     child: Card(
    //       child: Column(
    //         children: [
    //           _buildImage(),
    //           _buildText()
    //         ]
    //       )
    //     )
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp(),
      body: _buildBody(context),
      drawer: SideMenu(),
    );
  }
}