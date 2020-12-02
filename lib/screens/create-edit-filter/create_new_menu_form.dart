import 'package:flutter/material.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down/drop_down.dart';


class CreateNewMenuForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  CreateNewMenuForm({
    @required this.formKey
  });

  @override
  _CreateNewMenuFormState createState() => _CreateNewMenuFormState();
}

class _CreateNewMenuFormState extends State<CreateNewMenuForm> {
  final List<String> listYear = [];
  final List<String> listMonth = [];
  Map<String, dynamic> formData;

  @override
  void initState(){
    final DateTime today = DateTime.now();
    for (int i = 1940; i <= today.year; i++){
      listYear.add(i.toString());
    }
    if(formData['releaseDateYear'] == '')
      formData['releaseDateYear'] = listYear[listYear.length - 1];
    
    for(int i = 1; i <= 12; i++){
      listMonth.add(i.toString());
    }
    if(formData['releaseDateMonth'] == '')
      formData['releaseDateMonth'] = listMonth[listMonth.length - 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              DropDownWidget(
                items: listYear,
                value: formData['releaseDateYear'],
                onChanged: (String value){
                  setState(() {
                    formData['releaseDateYear'] = value;
                  });
                }
              ),
              SizedBox(width: basicPadding),
              DropDownWidget(
                items: listMonth,
                value: formData['releaseDateMonth'],
                onChanged: (String value){
                  setState(() {
                    formData['releaseDateMonth'] = value;
                  });
                }
              ),
              // DropDownWidget(
              //   items: listMonth,
              //   value: formData['releaseDateMonth'],
              //   onChanged: (String value){
              //     setState(() {
              //       formData['releaseDateMonth'] = value;
              //     });
              //   }
              // )
            ],
          )
        ],
      )
    );
  }
}