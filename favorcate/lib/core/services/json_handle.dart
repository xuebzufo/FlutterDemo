import 'dart:convert';
import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getDataFromLocalJson() async{
    //从文件夹中获取json文件
    String jsonStr = await rootBundle.loadString("assets/json/category.json");
    final result = json.decode(jsonStr);
    final resultList = result["category"];
    List<CategoryModel> categoryList=[];
    for(var map in resultList){
      categoryList.add(CategoryModel.fromJson(map));
    }
    return categoryList;
  }
}