import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favour_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_page.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/sq_int_extension.dart';
import 'package:provider/provider.dart';
class MealItem extends StatelessWidget {
  final MealModel model;
  MealItem(this.model);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(SQDetailScreen.routeName,arguments: model);
      },
      child: Card(
        margin: EdgeInsets.all(12.px),
        elevation: 5.px,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(12.px))) ,
        child: Column(
          children: <Widget>[
            createPicInfo(context),
            createOperationTool(),
          ],
        ),
      ),
    );
  }
  Widget createPicInfo(BuildContext context){
    return Stack(
      children: <Widget>[
        ClipRRect(
          child:Image.network(model.imageUrl,width: double.maxFinite,height:250.px ,fit: BoxFit.cover,),
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(12.px),
            topRight: Radius.circular(12.px)
          ),

        ),
        Positioned(
          right: 10.px,
          bottom: 5.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.all(5.px),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(5.px),
              color: Colors.black54,
            ),
            child: Text(model.title,style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),),
          ),
        ),
      ],
    );
  }
  Widget createOperationTool(){
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          OperationItem(Icon(Icons.schedule),'${model.duration}分钟'),
          OperationItem(Icon(Icons.restaurant),'${model.duration}分钟'),
          createFavourite(),
        ],
      ),
    );
  }
  Widget createFavourite(){
    return Consumer<FavourViewModel>(
      builder: (ctx,favourViewModel,child){
        IconData iconData = favourViewModel.isFavour(model)?Icons.favorite:Icons.favorite_border;
        Color iconColor =  favourViewModel.isFavour(model)?Colors.red:Colors.black;
        String title = favourViewModel.isFavour(model)?'收藏':'未收藏';
        return GestureDetector(
          child: OperationItem(Icon(iconData,color: iconColor,),title,textColor: iconColor,),
          onTap:(){
            favourViewModel.handleFavourEvent(model);
          } ,
        );
      },
    );
  }
}
