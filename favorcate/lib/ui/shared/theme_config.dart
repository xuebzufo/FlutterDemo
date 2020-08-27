import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ThemeConfig{
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  //2.普通模式
  static final Color norTextColors = Colors.black;

  static final ThemeData dayTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      bodyText1:TextStyle(fontSize: bodyFontSize,color:norTextColors ),
      headline5: TextStyle(fontSize: smallFontSize, color: Colors.black87,fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: largeFontSize, color: Colors.black87),

    ),
  );
// 3.暗黑模式
  static final Color darkTextColors = Colors.white;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
        bodyText1:TextStyle(fontSize: bodyFontSize,color: darkTextColors),
        headline5: TextStyle(fontSize: smallFontSize, color: Colors.white70),
        headline4: TextStyle(fontSize: normalFontSize, color: Colors.white70),
        headline3: TextStyle(fontSize: largeFontSize, color: Colors.white70),
      )
  );
}