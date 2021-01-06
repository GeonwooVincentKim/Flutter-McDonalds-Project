import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down.dart';


class DropDownDateFormat extends StatefulWidget {
  final GlobalKey<FormState> yearmonthKey;
  Map<String, dynamic> foodYearMonthMap;

  DropDownDateFormat({
    @required this.yearmonthKey,
    this.foodYearMonthMap
  });

  @override
  _DropDownDateFormatState createState() => _DropDownDateFormatState();
}

class _DropDownDateFormatState extends State<DropDownDateFormat> {
  final List<String> yearList = [];
  final List<String> monthList = [];
  final List<String> dayList = [];

  @override
  void initState(){
    final DateTime today = DateTime.now();
    for(int i = 1940; i <= today.year; i++){
      yearList.add(i.toString());
    }
    for(int i = 1; i <= today.month; i++){
      monthList.add(i.toString());
    }
    for(int i = 1; i <= today.day; i++){
      dayList.add(i.toString());
    }

    // When it is map
    if(widget.foodYearMonthMap['releaseYear'] == '')
      widget.foodYearMonthMap['releaseYear'] = yearList[yearList.length - 1];
    if(widget.foodYearMonthMap['releaseMonth'] == '')
      widget.foodYearMonthMap['releaseMonth'] = monthList[monthList.length - 1];
    if(widget.foodYearMonthMap['releaseDay'] == '')
      widget.foodYearMonthMap['releaseDay'] = dayList[dayList.length - 1];

    super.initState();
  }

  Widget _buildYearList(){
    return DropDownWidget(
      value: widget.foodYearMonthMap['releaseYear'],
      onChanged: (String value){
        setState(() {
          widget.foodYearMonthMap['releaseYear'] = value;
          print(value);
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthList(){
    return DropDownWidget(
      value: widget.foodYearMonthMap['releaseMonth'],
      onChanged: (String value){
        setState(() {
          widget.foodYearMonthMap['releaseMonth'] = value;
          print(value);
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
          _buildMonthList(),
        ],
      )
    );
  }
}