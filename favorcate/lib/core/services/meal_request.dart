import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/https_service.dart';

class MealRequest{
  static Future<List<MealModel>> request() async{
    final result =await HttpService.request('/meal');
    List listTemp = result["meal"];
    List<MealModel> resultList = [];
    for (var obj in listTemp) {
      resultList.add(MealModel.fromJson(obj));
    }
    return resultList;
  }
}