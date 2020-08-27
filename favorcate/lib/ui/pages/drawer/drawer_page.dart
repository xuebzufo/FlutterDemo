import 'package:favorcate/ui/pages/drawer/filter/filter_data.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/sq_int_extension.dart';
class SQDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 200.px,
      child: Drawer(
        child: Column(
          children: <Widget>[
            //1.标题
            createTitle(context),
            createListTitle(context,Icon(Icons.restaurant),"进餐",(){
              Navigator.pop(context);
            }),
            createListTitle(context,Icon(Icons.settings),"过滤",(){
              Navigator.pushNamed(context, SQFilterPage.routerName);
            }),
          ],
        ),
      ),
    );
  }
  Widget createTitle(BuildContext context){
    return Container(
      height: 80.px,
      margin: EdgeInsets.only(bottom: 16.px),
      color: Colors.amber,
      alignment: Alignment(0,0.5),
      child: Text('开始动手',style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold),),

    );
  }
  Widget createListTitle(BuildContext context,Icon icon,String title, Function handler){
    return ListTile(
      title: Text(title,style: Theme.of(context).textTheme.headline4,),
      leading: icon,
      onTap:handler,
    );
  }
}
