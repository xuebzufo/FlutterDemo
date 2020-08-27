import 'package:favorcate/core/viewmodel/favour_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SQMyFavorPage extends StatefulWidget {
  @override
  _SQMyFavorPageState createState() => _SQMyFavorPageState();
}

class _SQMyFavorPageState extends State<SQMyFavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: Consumer<FavourViewModel>(
        builder: (context,favourViewModel,child){
          if(favourViewModel.favours.length==0){
            return Center(child:Text("未收藏美食",style: Theme.of(context).textTheme.headline3,));
          }
          return ListView.builder(
              itemCount:favourViewModel.favours.length,
              itemBuilder:(ctx,index){
                return MealItem(favourViewModel.favours[index]);
              }
          );
        },
      ),
    );
  }
}
