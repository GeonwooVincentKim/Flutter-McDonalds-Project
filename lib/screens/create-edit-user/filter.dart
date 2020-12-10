

import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/provider/provider_filter.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/helpers/functions.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/button/bottom_button.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down_date_format.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down_date_format_map.dart';
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
  final _formKey = GlobalKey<FormState>();
  
  // final List<String> year = [];
  // final List<String> month = [];

  // MenuModel newFilterData = MenuModel(id: null, menuTitle: null, image: null, prices: null, releaseYear: null, releaseMonth: null);
  final Map<String, dynamic> _currentOrdersFilters = {
    // 'releaseYearMonth': '',
    'releaseYear': '',
    'releaseYearText': null,
    'releaseMonth': '',
    'releaseMonthText': null,
    // 'releaseDate': '',
    // 'year': null,
    // 'month': null,
  };

  @override
  void initState(){
    Map<String, dynamic> filterDate;
    if(widget.page == 'menu'){
      filterDate = Provider.of<FilterProvider>(context, listen: false).orderFilters;
    }else {
      filterDate = Provider.of<FilterProvider>(context, listen: false).prevOrderFilters;
    }
    // _currentOrdersFilters['releaseYearMonth'] = filterDate['releaseYearMonth'];
    // _currentOrdersFilters['releaseYear'] = filterDate['releaseYear'];
    // _currentOrdersFilters['releaseMonth'] = filterDate['releaseMonth'];
    _currentOrdersFilters['releaseYear'] = filterDate['releaseYear'];
    _currentOrdersFilters['releaseYearText'] = filterDate['releaseYearText'];
    _currentOrdersFilters['releaseMonth'] = filterDate['releaseMonth'];
    _currentOrdersFilters['releaseMonthText'] = filterDate['releaseMonthText'];

    // if(filterDate['releaseYearMonth'] != ''){
    //   final DateTime releaseYearMonth = getDateTimeFromString(filterDate['releaseYearMonth']);

    //   _currentOrdersFilters['releaseYear'] = releaseYearMonth.year.toString();
    //   _currentOrdersFilters['releaseMonth'] = releaseYearMonth.month.toString();
    // }
    if(filterDate['releaseYear'] != '' && filterDate['releaseMonth'] != ''){
      final int releaseYear = filterDate['releaseYear'];
      final int releaseMonth = filterDate['releaseMonth'];
      _currentOrdersFilters['releaseYearText'] = releaseYear.toString();
      _currentOrdersFilters['releaseMonthText'] = releaseMonth.toString();
    }else{
      if(filterDate['releaseYear'] != ''){
        final int releaseYear = filterDate['releaseYear'];
        _currentOrdersFilters['releaseYearText'] = releaseYear.toString();
        // final DateTime releaseYear = getDateTimeMonthString(filterDate['releaseYear']);
        // _currentOrdersFilters['releaseYearText'] = releaseYear.year.toString();
      }
      if(filterDate['releaseMonth'] != ''){
        final int releaseMonth = filterDate['releaseMonth'];
        _currentOrdersFilters['releaseMonthText'] = releaseMonth.toString();
        // final DateTime releaseMonth = getDateTimeMonthString(filterDate['releaseMonth']);
        // _currentOrdersFilters['releaseMonthText'] = releaseMonth.month.toString();
        // print(releaseMonth.month);
      }
    }
    super.initState();
  }

  Widget _buildFilterAppBar(){
    return AppBar(
      title: Text("Filter"),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                DropDownDateFormatMap(
                  yearmonthKey: _formKey,
                  menuYearMonthMap: _currentOrdersFilters,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomButton(contents: "Reset", onPressed: () => _buildResetFilter()),
                    BottomButton(contents: "Apply", onPressed: () => _buildFilterForm(context)),
                  ]
                )
              ]
            ),
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFilterAppBar(),
      body: _buildFilterBody(),
      drawer: SideMenu(),
    );
  }

  void _buildFilterForm(context){
    // if(!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    if(widget.page == 'menu'){
      // Provider.of<FilterProvider>(context).changeOrderNoMapFilters(newFilterData);
      Provider.of<FilterProvider>(context, listen: false).changeOrderFilters(_currentOrdersFilters);
    }else{
      Provider.of<FilterProvider>(context, listen: false).changePrevOrderFilters(_currentOrdersFilters);
    }
    Navigator.pop(context);
  }

  void _buildResetFilter(){
    _formKey.currentState.reset();
    setState(() {
      // _currentOrdersFilters['releaseYearMonth'] = '';
      _currentOrdersFilters['releaseYear'] = '';
      _currentOrdersFilters['releaseYearText'] = null;
      // _currentOrdersFilters['year'] = null;
      _currentOrdersFilters['releaseMonth'] = '';
      _currentOrdersFilters['releaseMonthText'] = null;
    });

    if(widget.page == 'menu'){
      Provider.of<FilterProvider>(context, listen: false).changeOrderFilters(_currentOrdersFilters);
    }else{
      Provider.of<FilterProvider>(context, listen: false).changePrevOrderFilters(_currentOrdersFilters);
    }
  }
}