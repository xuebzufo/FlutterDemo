import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category =  ModalRoute.of(context).settings.arguments as CategoryModel;

    return Selector<MealViewModel,List<MealModel>>(
      selector: (ctx,mealViewModel){
       return mealViewModel.meals.where((model) => model.categories.contains(category.id) ).toList();
      },
      builder:(context, meals, child){
        return ListView.builder(
          itemCount:meals.length,
          itemBuilder:(ctx,index){
            return MealItem(meals[index]);
          }
        );
      } ,
    );
  }
}
