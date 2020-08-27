import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/json_handle.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/sq_int_extension.dart';
import '../../../core/extension/sq_double_extension.dart';
class SQHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getDataFromLocalJson(),
      builder: (ctx,snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.error!=null){
          return Center(child: Text('请求失败!'),);
        }
        final itemsList = snapshot.data;
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: itemsList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing:20.px,
            crossAxisSpacing:20.px,
            childAspectRatio:1.5,
          ),
          itemBuilder: (ctx,index){
            CategoryModel model = itemsList[index];
            return createItem(model,context);
          },
        );
      },
    );
  }
  Widget createItem(CategoryModel model,BuildContext context){
    return GestureDetector(
      onTapUp: (detail){
        Navigator.of(context).pushNamed(MealInfoPage.routeName,arguments:model );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient:LinearGradient(
            colors:[
              model.cColor.withOpacity(0.5),
              model.cColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(model.title,style:Theme.of(context).textTheme.headline5,),
      ),
    );
  }
}

//class _SQHomeContentState extends State<SQHomeContent> {
//  List<CategoryModel> list=[];
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    JsonParse.getDataFromLocalJson().then((value){
//      setState(() {
//        list.addAll(value);
//      });
//
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      padding: EdgeInsets.all(20.px),
//      itemCount: list.length,
//      gridDelegate:
//        SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount:2,
//        mainAxisSpacing:20.px,
//        crossAxisSpacing:20.px,
//        childAspectRatio:1.5,
//    ), itemBuilder: (ctx,index){
//      CategoryModel model = list[index];
//      return createItem(model,context);
//    },
//    );
//  }
//  Widget createItem(CategoryModel model,BuildContext context){
//    return Container(
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(12),
//        gradient:LinearGradient(
//            colors:[
//              model.cColor.withOpacity(0.5),
//              model.cColor,
//            ],
//        ),
//      ),
//      alignment: Alignment.center,
//      child: Text(model.title,style:Theme.of(context).textTheme.headline5,),
//    );
//  }
//}
