import 'package:favorcate/core/viewmodel/favour_view_model.dart';
import 'package:flutter/cupertino.dart';

class FilterViewModel extends ChangeNotifier{
  FavourViewModel _favourViewModel;
  bool _isGlutenFree=false;
  bool _isVegan=false;
  bool _isVegetarian=false;
  bool _isLactoseFree=false;

  bool get isGlutenFree => _isGlutenFree;
  updateFavourModel(FavourViewModel favourViewModel){
    _favourViewModel = favourViewModel;
  }
  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
    _favourViewModel.updateState();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
    _favourViewModel.updateState();
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
    _favourViewModel.updateState();
  }

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
    _favourViewModel.updateState();
  }
}