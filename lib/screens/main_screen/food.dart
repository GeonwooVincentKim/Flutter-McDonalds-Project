import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_food.dart';
import 'package:provider/provider.dart';


class Food extends StatefulWidget {
  final String foodID;
  Food({@required this.foodID});
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  CategoryModel cate;

  @override
  void initState(){
    cate = Provider.of<ProviderCategory>(context, listen: false).category;
    // if(cate == null){
      // final List<CategoryModel> food = Provider.of<ProviderCategory>(context, listen: false).categoryList.toList();
      // Get one item from foodID.
      // If foodID matches to foodList, then shows the category what the User selected.
      // cate = food.firstWhere((foodTitle) => foodTitle.categoryID == widget.foodID);
    // }
    super.initState();
  }

  Widget _buildfoodAppBar(){
    return AppBar(
      title: Text(cate.name),
      centerTitle: true,
    );
  }

  Widget _buildfoodBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderFood>(
        builder: (ctx, food, child){
          // final Map<String, dynamic> foodFilter = Provider.of<FilterProvider>(context).orderFilters;
          // Get all items of list that match to CategoryList's type.
          List<FoodModel> foodList = [];
          foodList = food.foodList.where((food) => food.id.contains(cate.categoryID)).toList();
          // foodList = food.foodList.where((food) => food.type == cate.type).toList();

          return foodList.length == 0 || foodList.length == null ?
            Center(child: Text("NOO!!!")) :
            GridView.builder(
              shrinkWrap: true,
              itemCount: foodList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              itemBuilder: (context, index) => ListTileFood(foodContents: foodList[index]),
            );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildfoodAppBar(),
      body: _buildfoodBody(),
      drawer: SideMenu(),
    );
  }
}
