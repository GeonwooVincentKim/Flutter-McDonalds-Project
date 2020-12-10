import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_menu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/drop_down/drop_down.dart';


class DropDownDateFormatMap extends StatefulWidget {
  final GlobalKey<FormState> yearmonthKey;
  Map<String, dynamic> menuYearMonthMap;

  DropDownDateFormatMap({
    @required this.yearmonthKey,
    this.menuYearMonthMap
  });

  @override
  _DropDownDateFormatMapState createState() => _DropDownDateFormatMapState();
}

class _DropDownDateFormatMapState extends State<DropDownDateFormatMap> {
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

    // When it is map, and the user gonna filter the list.
    if(widget.menuYearMonthMap['releaseYearText'] == '')
      widget.menuYearMonthMap['releaseYearText'] = yearList[yearList.length - 1];
    if(widget.menuYearMonthMap['releaseMonthText'] == '')
      widget.menuYearMonthMap['releaseMonthText'] = monthList[monthList.length - 1];

    super.initState();
  }

  Widget _buildYearList(){
    return DropDownWidget(
      // value: widget.menuModelYearMonth.releaseYear,
      value: widget.menuYearMonthMap['releaseYearText'],
      onChanged: (String value){
        setState(() {
          // widget.menuModelYearMonth.releaseYear = value;
          widget.menuYearMonthMap['releaseYearText'] = value;
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthList(){
    return DropDownWidget(
      // value: widget.menuModelYearMonth.releaseMonth,
      value: widget.menuYearMonthMap['releaseMonthText'],
      onChanged: (String value){
        setState(() {
          // widget.menuModelYearMonth.releaseMonth = value;
          widget.menuYearMonthMap['releaseMonthText'] = value;
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