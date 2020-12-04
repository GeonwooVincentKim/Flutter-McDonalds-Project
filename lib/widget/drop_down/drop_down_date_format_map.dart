import 'package:flutter/material.dart';
import 'package:myTestApp/model/food_model/model_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down.dart';


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

    // When it is map
    if(widget.menuYearMonthMap['releaseYear'] == '')
      widget.menuYearMonthMap['releaseYear'] = yearList[yearList.length - 1];
    if(widget.menuYearMonthMap['releaseMonth'] == '')
      widget.menuYearMonthMap['releaseMonth'] = monthList[monthList.length - 1];

    super.initState();
  }

  Widget _buildYearList(){
    // return Text("hi");
    return DropDownWidget(
      // value: widget.menuModelYearMonth.releaseYear,
      value: widget.menuYearMonthMap['releaseYear'],
      onChanged: (String value){
        setState(() {
          // widget.menuModelYearMonth.releaseYear = value;
          widget.menuYearMonthMap['releaseYear'] = value;
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthList(){
    // return Text("JHI");
    return DropDownWidget(
      // value: widget.menuModelYearMonth.releaseMonth,
      value: widget.menuYearMonthMap['releaseMonth'],
      onChanged: (String value){
        setState(() {
          // widget.menuModelYearMonth.releaseMonth = value;
          widget.menuYearMonthMap['releaseMonth'] = value;
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