import 'package:flutter/material.dart';
import 'package:myTestApp/model/model_main_menu.dart';
import 'package:myTestApp/shared/style/style.dart';
import 'package:myTestApp/widget/drop_down_widget/drop_down_screen.dart';


class CreateNewDetailMenuForm extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String image;
  final GlobalKey<FormState> formKey;

  CreateNewDetailMenuForm({
    @required this.formData,
    this.image,
    @required this.formKey 
  });

  
  @override
  _CreateNewDetailMenuFormState createState() => _CreateNewDetailMenuFormState();
}

class _CreateNewDetailMenuFormState extends State<CreateNewDetailMenuForm> {
  // List<MainMenuModel> mainMenuList = [];
  // List<String> mainMenuName = [];
  final List<String> listYear = [];
  final List<String> listMonth = [];

  @override
  void initState(){
    // mainMenuName = mainMenuList.map((mainMenu) => mainMenu.foodName).toList();
    // widget.formData['selectMenu'] = mainMenuName[0];

    final DateTime today = DateTime.now();
    for(int i = 1940; i <= today.year; i++){
      listYear.add(i.toString());
    }
    if(widget.formData['releaseDateYear'] == ''){
      widget.formData['releaseDateYear'] = listYear[listYear.length - 1];
    }

    for(int i = 1; i <= today.month; i++){
      listMonth.add(i.toString());
    }
    if(widget.formData['releaseDateMonth'] == ''){
      widget.formData['releaseDateMonth'] = listMonth[listMonth.length - 1];
    }
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
                value: widget.formData['releaseDateYear'],
                onChanged: (String value){
                  setState(() {
                    widget.formData['releaseDateYear'] = value;
                  });
                }
              ),
              SizedBox(width: basicPadding),
              DropDownWidget(
                items: listMonth,
                value: widget.formData['releaseDateMonth'],
                onChanged: (String value){
                  setState(() {
                    widget.formData['releaseDateMonth'] = value;
                  });
                }
              )
            ],
          )
        ],
      )
    );
  }
}