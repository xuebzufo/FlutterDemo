import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier{
  List<MealModel> _meals = [] ;
  FilterViewModel _filterModel = FilterViewModel();
  set filterModel(FilterViewModel model){
    _filterModel = model;
    notifyListeners();
  }
  List<MealModel> get meals {
    return _meals.where((mealModel) {
      if(_filterModel.isGlutenFree&&!mealModel.isGlutenFree){
        return false;
      }
      if(_filterModel.isVegetarian&&!mealModel.isVegetarian){
        return false;
      }
      if(_filterModel.isLactoseFree&&!mealModel.isLactoseFree){
        return false;
      }
      if(_filterModel.isVegan&&!mealModel.isVegan){
        return false;
      }

      return true;
    }).toList();
  }
  MealViewModel(){
    print("_meals");
     MealRequest.request().then((value) {
       _meals = value;
       print(_meals);
       notifyListeners();
     });
  }
}