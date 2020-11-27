import 'package:flutter/material.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/helpers/icomoon.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/alert_dialog/bottom_button.dart';


class Filter extends StatefulWidget {
  final String page;
  Filter(this.page);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _currentOrdersFilters = {
    ''
    'year': null,
    'month': null,
  };

  final Map<String, dynamic> _previousOrdersFilters = {
    'year': null,

  };

  Widget _buildFilterAppBar(){
    return AppBar(
      title: Text("Filter"),
      backgroundColor: BasicAppBarColor,
      centerTitle: true,
    );
  }

  Widget _buildFilterBody(){
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.all(basicPadding * 2),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basicPadding * 2),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "Reset", onPressed: () => _buildResetFilter()),
                    BottomButton(contents: "Apply", onPressed: () => _buildFilterForm(context)),
                  ]
                )
            ]
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFilterAppBar(),
      body: _buildFilterBody(),
      backgroundColor: BasicBackgroundColor,
      drawer: SideMenu(),
    );
  }

  void _buildFilterForm(context){
    
  }

  void _buildResetFilter(){
    formKey.currentState.reset();
    setState(() {
      
    });
  }
}