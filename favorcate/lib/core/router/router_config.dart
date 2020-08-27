

import 'package:favorcate/ui/pages/detail/detail_page.dart';
import 'package:favorcate/ui/pages/drawer/filter/filter_data.dart';
import 'package:favorcate/ui/pages/main/main_page.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RouterConfig{
  static final Map<String, WidgetBuilder> routerMap ={
    MainPage.routerName : (context)=>MainPage(),
    MealInfoPage.routeName:(context)=>MealInfoPage(),
    SQDetailScreen.routeName:(context)=>SQDetailScreen(),
  };
  static RouteFactory generateRoute = (RouteSettings settings){
    if(settings.name == SQFilterPage.routerName ){
      return MaterialPageRoute(
          builder: (ctx){
            return SQFilterPage();
          },
        fullscreenDialog: true,
      );
    }
    return null;
  };
}