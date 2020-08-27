import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favour_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/sq_int_extension.dart';
import 'package:provider/provider.dart';
class SQDetailScreen extends StatelessWidget {
  static String routeName = '/mealDetail';

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context).settings.arguments as MealModel;
    return Scaffold(
      appBar:AppBar(title: Text(model.title),) ,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //1.图片展示
            createMealPicShow(model.imageUrl),
            //2.制作材料
            createTitle(context,'制作材料'),
            createMealIngredients(context,model.ingredients),
            //3.制作步骤
            createTitle(context,'制作步骤'),
            createMakeProgress(context,model.steps),
          ],
        ),
      ),
      floatingActionButton:createFloatingBtn(model),
    );


  }
  //收藏按钮
  Widget createFloatingBtn(MealModel model){
    return Consumer<FavourViewModel>(
        builder:(BuildContext context, FavourViewModel value, Widget child){
          IconData iconData = value.isFavour(model)?Icons.favorite:Icons.favorite_border;
          Color iconColor =  value.isFavour(model)?Colors.red:Colors.black;
          return FloatingActionButton(
            child: Icon(iconData,color:iconColor),
            onPressed: (){
              value.handleFavourEvent(model);
            },
          );
        }
    );

  }
  //1.图片展示
  Widget createMealPicShow(String src){
    return Image.network(src,width: double.maxFinite,height: 250.px,fit: BoxFit.cover,);
  }

  //标题
  Widget createTitle(BuildContext context,String title){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.px),
      child: Text(title,style:Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold) ,),

    );
  }
  //2.制作材料
  Widget createMealIngredients(BuildContext context,List<String> ingredients){
     return Container(
       width: MediaQuery.of(context).size.width-30.px,
       padding: EdgeInsets.all(8.px),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(12.px),
         border:Border.all(width: 1.px,color: Colors.black12),
       ),
       child: ListView.builder(
         padding: EdgeInsets.zero,
         shrinkWrap:true ,
         itemCount: ingredients.length,
         itemBuilder: (ctx,index){
               return Card(child: Padding(padding: EdgeInsets.symmetric(horizontal:10,vertical: 5 ),child: Text(ingredients[index])),color:Theme.of(context).accentColor ,);
         },
         physics: NeverScrollableScrollPhysics(),

       ),
     );
  }

  //3.制作步骤
  Widget createMakeProgress(BuildContext context,List<String> progresses){
    return Container(
      width: MediaQuery.of(context).size.width-30.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.px),
        border:Border.all(width: 1.px,color: Colors.black12),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap:true ,
        itemCount: progresses.length,
        itemBuilder: (ctx,index){
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index+1}"),
            ),
            title: Text(progresses[index]),
          );
        },
        separatorBuilder:(context,index){
          return Divider();
        },
        physics: NeverScrollableScrollPhysics(),

      ),
    );
  }
  //3.listtile

}
