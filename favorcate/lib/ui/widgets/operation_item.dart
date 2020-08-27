import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/sq_int_extension.dart';
class OperationItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color textColor;
  OperationItem(this.icon, this.title,{this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 8.px),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(width: 5.px,),
          Text(title,style: Theme.of(context).textTheme.bodyText1.copyWith(color:this.textColor ),),
        ],
      ),
    );
  }


}
