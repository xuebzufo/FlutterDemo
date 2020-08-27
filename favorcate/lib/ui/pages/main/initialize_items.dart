import 'package:favorcate/ui/pages/favor/my_favor_page.dart';
import 'package:favorcate/ui/pages/home/home_page_main.dart';
import 'package:flutter/material.dart';
final List<Widget> pageslist = [
  SQHomePage(),
  SQMyFavorPage(),
];
final List<BottomNavigationBarItem> barList =[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text('首页'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    title: Text('收藏'),
  ),
];