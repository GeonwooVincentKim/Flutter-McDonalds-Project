import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down.dart';


class DropDownDateFormat extends StatefulWidget {
  GlobalKey<FormState> yearmonthKey;
  MenuModel menuModelYearMonth;
  
  DropDownDateFormat({
    @required this.yearmonthKey,
    @required this.menuModelYearMonth
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
    if(widget.menuModelYearMonth.releaseYear == '')
      widget.menuModelYearMonth.releaseYear = yearList[yearList.length - 1];
    for(int i = 1; i <= today.month; i++){
      monthList.add(i.toString());
    }
    if(widget.menuModelYearMonth.releaseMonth == '')
      widget.menuModelYearMonth.releaseMonth = monthList[monthList.length - 1];
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