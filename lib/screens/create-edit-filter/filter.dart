

import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/provider/provider_filter.dart';
import 'package:myTestApp/screens/sidemenu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/button/bottom_button.dart';
import 'package:myTestApp/widget/drop_down/drop_down_date_format.dart';
import 'package:provider/provider.dart';


class Filter extends StatefulWidget {
  final String page;
  Filter(this.page);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // final List<String> _currentOrderFilters = [
  //   ''
  // ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MenuModel newMenu = MenuModel(id: null, menuTitle: null, image: null, prices: null, releaseYear: null, releaseMonth: null);
  final Map<String, dynamic> _currentOrdersFilters = {
    // 'releaseDate': '',
    // 'year': null,
    // 'month': null,
      
  };

  @override
  void initState(){
    // Map<String, dynamic> filterDate;
    // _currentOrdersFilters['releaseDate'] = filterDate['releaseDate'];
    // _currentOrdersFilters['year'] = filterDate['year'];
    // _currentOrdersFilters['month'] = filterDate['month'];
    // if(filterDate['releaseDate'] != ''){
    //   final DateTime releaseDate = getDateTimeFromString(filterDate['releaseDate']);
    //   _currentOrdersFilters['']
    // }
    super.initState();
  }

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
              DropDownDateFormat(
                yearmonthKey: _formKey,
                menuModelYearMonth: newMenu
              ),
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
    _formKey.currentState.save();
    if(widget.page == 'Orders'){
      Provider.of<FilterProvider>(context, listen: false).changeOrderFilters(_currentOrdersFilters);
    }else{
      Provider.of<FilterProvider>(context, listen: false).changePrevOrderFilters(_currentOrdersFilters);
    }
    Navigator.pop(context);
  }

  void _buildResetFilter(){
    _formKey.currentState.reset();
    setState(() {
      _currentOrdersFilters['releaseDate'] = '';
      _currentOrdersFilters['year'] = null;
      _currentOrdersFilters['month'] = null;
    });

    if(widget.page == 'Orders'){
      Provider.of<FilterProvider>(context, listen: false).changeOrderFilters(_currentOrdersFilters);
    }else{
      Provider.of<FilterProvider>(context, listen: false).changePrevOrderFilters(_currentOrdersFilters);
    }
  }
}