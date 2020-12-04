import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down.dart';


class DropDownDateFormat extends StatefulWidget {
  final GlobalKey<FormState> yearmonthKey;
  MenuModel menuModelYearMonth;
  // Map<String, dynamic> menuYearMonthMap;
  
  DropDownDateFormat({
    @required this.yearmonthKey,
    this.menuModelYearMonth,
    // this.menuYearMonthMap 
  });

  @override
  _DropDownDateFormatState createState() => _DropDownDateFormatState();
}

class _DropDownDateFormatState extends State<DropDownDateFormat> {
  final List<String> yearList = [];
  final List<String> monthList = [];

  @override
  void initState(){
    final DateTime today = DateTime.now();
    for(int i = 1940; i <= today.year; i++){
      yearList.add(i.toString());
    }
    for(int i = 1; i <= today.month; i++){
      monthList.add(i.toString());
    }

    // When it is not map
    if(widget.menuModelYearMonth.releaseYear == '')
      widget.menuModelYearMonth.releaseYear = yearList[yearList.length - 1];
    if(widget.menuModelYearMonth.releaseMonth == '')
      widget.menuModelYearMonth.releaseMonth = monthList[monthList.length - 1];
    
    // // When it is map
    // if(widget.menuYearMonthMap['releaseYear'] == '')
    //   widget.menuYearMonthMap['releaseYear'] = yearList[yearList.length - 1];
    // if(widget.menuYearMonthMap['releaseMonth'] == '')
    //   widget.menuYearMonthMap['releaseMonth'] = monthList[monthList.length - 1];

    super.initState();
  }

  Widget _buildYearList(){
    return DropDownWidget(
      value: widget.menuModelYearMonth.releaseYear,
      onChanged: (String value){
        setState(() {
          widget.menuModelYearMonth.releaseYear = value;
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthList(){
    return DropDownWidget(
      value: widget.menuModelYearMonth.releaseMonth,
      onChanged: (String value){
        setState(() {
          widget.menuModelYearMonth.releaseMonth = value;
        });
      },
      items: monthList
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(basicPadding),
      child: Row(
        children: [
          _buildYearList(),
          _buildMonthList()
        ],
      )
    );
  }
}