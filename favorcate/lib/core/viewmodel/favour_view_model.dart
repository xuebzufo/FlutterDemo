import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';

class FavourViewModel extends ChangeNotifier{
  List<MealModel> _favours = [];
  FilterViewModel _filterModel = FilterViewModel();
  set filterModel(FilterViewModel model){
    print("filterModel");
    _filterModel = model;
  }
  updateState(){
    notifyListeners();
  }
  get favours{
    print("favours");
    return _favours.where((favourViewModel){
      if(_filterModel.isGlutenFree&&!favourViewModel.isGlutenFree){
        return false;
      }
      if(_filterModel.isVegetarian&&!favourViewModel.isVegetarian){
        return false;
      }
      if(_filterModel.isLactoseFree&&!favourViewModel.isLactoseFree){
        return false;
      }
      if(_filterModel.isVegan&&!favourViewModel.isVegan){
        return false;
      }

      return true;
    }).toList();
  }
  addFavour(MealModel model){
    if(!_favours.contains(model)){
      _favours.add(model);
      notifyListeners();
    }
  }
  removeFavour(MealModel model){
    _favours.remove(model);
    notifyListeners();
  }
  bool isFavour(MealModel model){
    return _favours.contains(model);
  }
  handleFavourEvent(MealModel model){
    if(isFavour(model)){
      removeFavour(model);
    }else{
      addFavour(model);
    }
  }
}