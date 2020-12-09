import 'package:flutter/material.dart';
import 'package:myTestApp_Test/shared/style/style.dart';


class DropDownWidget extends StatelessWidget{
  final Text hint;
  final String value;
  final Function onChanged;
  final List<String> items;

  DropDownWidget({
    this.hint,
    @required this.value,
    @required this.onChanged,
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: hint,
      value: value,
      onChanged: onChanged,
      // items: items.map((String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Container(
      //       padding: EdgeInsets.symmetric(horizontal: basicPadding),
      //       // child: Column(
      //       //   crossAxisAlignment: CrossAxisAlignment.start,
      //       //   children: [
      //       //     Text(value, style: TextStyle(color: Colors.black38)),
      //       //     SizedBox(width: 1.0),
      //       //   ],
      //       // ),
      //       child: Text(value, style: TextStyle(color: Colors.black38)),
      //     ),
      //   );
      // }).toList()
      items: items.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem(
          value: value,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: basicPadding),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(value, style: TextStyle(color: Colors.black38)),
            //     SizedBox(width: 1.0),
            //   ],
            // ),
            child: Text(value),
          ),
        );
      }).toList()
    );
  }
}