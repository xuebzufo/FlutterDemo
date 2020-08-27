import 'package:favorcate/ui/pages/drawer/drawer_page.dart';
import 'package:favorcate/ui/pages/main/initialize_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final String routerName = "/";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
          index: _currentIndex,
          children: pageslist
      ) ,

      bottomNavigationBar: BottomNavigationBar(
        items: barList,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: SQDrawer(),
    );
  }
}
