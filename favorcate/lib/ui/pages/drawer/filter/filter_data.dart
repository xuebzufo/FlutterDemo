import 'package:favorcate/ui/pages/drawer/filter/filter_content.dart';
import 'package:flutter/material.dart';

class SQFilterPage extends StatelessWidget {
  static final String routerName ='/filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过滤食谱"),
      ),
      body: SQFilterContent(),
    );
  }
}
