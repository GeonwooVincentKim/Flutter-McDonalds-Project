import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_user.dart';
import 'package:myTestApp/providers/provider_user.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/divider.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/alert_dialog/bottom_button.dart';
import 'package:myTestApp/widget/title/contents_title.dart';
import 'package:provider/provider.dart';


class Settings extends StatelessWidget {
  UserModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: _buildSettingsAppBar(context),
      body: _buildSettingsBody(context),
      backgroundColor: BasicBackgroundColor,
    );
  }

  Widget _buildSettingsAppBar(BuildContext context){
    return AppBar(
      title: Text("Settings"),
      backgroundColor: BasicAppBarColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            IconMoon.iedit,
            color: Colors.white,
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
      color: CartOrderColor,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        // overflow: Overflow.visible,
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
      color: CartOrderColor,
      width: screenWidth,
      child: BottomButton(contents: "Modify".toUpperCase(), onPressed: () => Navigator.pushNamed(context, "/settings/modify")),
    );
  }
}