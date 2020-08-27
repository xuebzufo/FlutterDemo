import 'package:favorcate/core/router/router_config.dart';
import 'package:favorcate/core/viewmodel/favour_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/shared/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create:(context)=>FilterViewModel() ,
          ),
          ChangeNotifierProxyProvider<FilterViewModel,MealViewModel>(
            create:(context)=>MealViewModel() ,
            update:(context,filterViewModel,mealViewModel){
              mealViewModel.filterModel = filterViewModel;
              return mealViewModel;
            } ,
          ),
          ChangeNotifierProxyProvider<FilterViewModel,FavourViewModel>(
            create:(context)=>FavourViewModel() ,
            update:(context,filterViewModel,favourViewModel){
              favourViewModel.filterModel = filterViewModel;
              filterViewModel.updateFavourModel(favourViewModel);
              return favourViewModel;
            } ,
          ),
//          ChangeNotifierProvider(
//            create:(context)=>FavourViewModel() ,
//          ),
        ],
        child: MyApp(),
      )

     );

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeConfig.dayTheme,
      darkTheme: ThemeConfig.darkTheme,
      routes: RouterConfig.routerMap,
      onGenerateRoute:RouterConfig.generateRoute ,
    );
  }
}

