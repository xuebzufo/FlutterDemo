import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';
class MealInfoPage extends StatelessWidget {
  static const String routeName = "/detail";
  @override
  Widget build(BuildContext context) {
    print("MealInfoPage");
    final categoryModel = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
      ),
      body: MealContent(),
    );
  }
}
  