import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_user.dart';
import 'package:myTestApp_Test/provider/provider_user.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/divider.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/contents/contents_title.dart';
import 'package:provider/provider.dart';


class Settings extends StatelessWidget {
  final String title;
  Settings({@required this.title});

  UserModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: _buildSettingsAppBar(context),
      body: _buildSettingsBody(context),
    );
  }

  Widget _buildSettingsAppBar(BuildContext context){
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).cardColor,
          ), onPressed: () => Navigator.pushNamed(context, "/settings/modify")
        )
      ],
    );
  }

  Widget _buildSettingsBody(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding),
      child: Consumer<UserProvider>(
        builder: (ctx, userInfo, child){
          final UserModel user = userInfo.user;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildUserInfoText(user, context),
              _buildUserInfoClick(context),
            ]
          );
        }
      ),
    );
  }

  Widget _buildUserInfoText(UserModel user, BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight / 3,
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding),
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your Account Info".toUpperCase(), style: menuTitleSize),
          TransparentDivider(),
          ContentsTitle(ctxTitle: "First Name", ctxContents: user.firstName, marginBottom: basicPadding / 2),
          ContentsTitle(ctxTitle: "Last Name", ctxContents: user.lastName),
          ContentsTitle(ctxTitle: "E-Mail", ctxContents: user.userEmail, marginBottom: basicPadding / 2),
          ContentsTitle(ctxTitle: "Address", ctxContents: user.yourAddress, marginBottom: basicPadding / 2),
        ]
      )
    );
  }

  Widget _buildUserInfoClick(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: basicPadding, vertical: basicPadding),
      color: Theme.of(context).primaryColor,
      width: screenWidth,
      child: BottomButton(contents: "Modify".toUpperCase(), onPressed: () => Navigator.pushNamed(context, "/settings/modify")),
    );
  }
}