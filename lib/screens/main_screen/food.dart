import 'package:flutter/material.dart';
import 'package:myTestApp_Test/model/model_category.dart';
import 'package:myTestApp_Test/model/model_food.dart';
import 'package:myTestApp_Test/provider/provider_category.dart';
import 'package:myTestApp_Test/provider/provider_Food.dart';
import 'package:myTestApp_Test/screens/sidemenu.dart';
import 'package:myTestApp_Test/shared/style/style.dart';
import 'package:myTestApp_Test/widget/list_tile/list_tile_Food.dart';
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
      // final List<CategoryModel> Food = Provider.of<ProviderCategory>(context, listen: false).categoryList.toList();
      // Get one item from FoodID.
      // If FoodID matches to FoodList, then shows the category what the User selected.
      // cate = Food.firstWhere((FoodTitle) => FoodTitle.categoryID == widget.FoodID);
    // }
    super.initState();
  }

  Widget _buildFoodAppBar(){
    return AppBar(
      title: Text(cate.name),
      centerTitle: true,
    );
  }

  Widget _buildFoodBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: basicPadding, horizontal: basicPadding / 2),
      margin: EdgeInsets.all(basicMargin),
      child: Consumer<ProviderFood>(
        builder: (ctx, food, child){
          // final Map<String, dynamic> FoodFilter = Provider.of<FilterProvider>(context).orderFilters;
          // Get all items of list that match to CategoryList's type.
          List<FoodModel> foodList = [];
          foodList= food.foodItemList.toList();
          // foodList = food.foodItemList.where((food) => food.id.contains(cate.categoryID)).toList();
          // FoodList = Food.FoodList.where((Food) => Food.type == cate.type).toList();

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
      appBar: _buildFoodAppBar(),
      body: _buildFoodBody(),
      drawer: SideMenu(),
    );
  }
}
