import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/sq_int_extension.dart';
import 'package:provider/provider.dart';
class SQFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //1.标题
        createHeaderTitle(context),
        //2.过滤列表
        createFilterList(),
      ],
    );
  }
  Widget createHeaderTitle(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        top: 20.px,
        bottom: 20.px,
      ),
      alignment:Alignment.center,
      child: Text(
        "展示你的选择",
        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget createFilterList(){
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (ctx,filterViewModel,child){
         return ListView(
            children: <Widget>[
              createListTitle('五谷蛋白','五谷蛋白',filterViewModel.isGlutenFree,(flag){
                filterViewModel.isGlutenFree = flag;
              }),
              createListTitle('不含乳糖','不含乳糖',filterViewModel.isLactoseFree,(flag){
                filterViewModel.isLactoseFree = flag;
              }),
              createListTitle('素食主义','素食主义',filterViewModel.isVegetarian,(flag){
                filterViewModel.isVegetarian = flag;
              }),
              createListTitle('严格素食主义','严格素食主义',filterViewModel.isVegan,(flag){
                filterViewModel.isVegan = flag;
              }),
            ],
          );
        },

      ),
    );
  }
  Widget createListTitle(String title,String subtitle,bool isSelect, Function handler){
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: isSelect, onChanged: handler
      ),
    );
  }
}
