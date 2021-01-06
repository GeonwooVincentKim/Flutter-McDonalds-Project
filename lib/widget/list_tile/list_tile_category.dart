import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_cart.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/shared/style/text.dart';
import 'package:provider/provider.dart';


class ListTileCategory extends StatelessWidget {
  // final FoodModel cate;
  final CategoryModel cate;
  ListTileCategory({@required this.cate});

  Widget _buildCategoryImage(){
    return Container(
      child: Image.asset(
        cate.image,
        fit: BoxFit.fill
      )
    );
  }

  Widget _buildCategoryBody(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextDesign(
            // basicText: cate.menuTitle,
            basicText: cate.name,
            textStyle: mainListSize
          ),
          Divider(height: 5, color: Colors.transparent),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          // Provider.of<ProviderMenu>(context, listen: false).selectCategory(cate);
          Provider.of<ProviderCategory>(context, listen: false).selectMenu(cate);
          // Navigator.pushNamed(context, "/food/${cate.id}");
          Navigator.pushNamed(context, "/food/${cate.categoryID}");
        },
        child: Card(
          child: Column(
            children: [
              _buildCategoryImage(),
              _buildCategoryBody(context),
            ]
          )
        )
      )
    );
  }
}