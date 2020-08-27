import 'dart:ui';

import 'package:flutter/cupertino.dart';


class ScreenInfo {
  final double physicalWidth;
  final double physicalHeight;
  final double screenWidth;
  final double screenHeight;
  final double dpr;
  final double statusHeight;

  final double rpx;
  final double px;
  factory ScreenInfo()=>_getInstance();
  static ScreenInfo get instance =>_getInstance();
  static ScreenInfo _info;
  static final standardSize = 750;
  ScreenInfo._internal({this.physicalWidth, this.physicalHeight, this.screenWidth,
      this.screenHeight, this.dpr, this.statusHeight, this.rpx, this.px});
  static ScreenInfo _getInstance() {
    if(_info ==null){
      // 1.手机的物理分辨率
      var physicalWidth = window.physicalSize.width;
      var physicalHeight = window.physicalSize.height;

      // 2.获取dpr
      var dpr = window.devicePixelRatio;

      // 3.宽度和高度
      var screenWidth = physicalWidth / dpr;
      var screenHeight = physicalHeight / dpr;

      // 4.状态栏高度
      var statusHeight = window.padding.top / dpr;

      // 5.计算rpx的大小
      var rpx = screenWidth / standardSize;
      var px = screenWidth / standardSize * 2;
      _info = new ScreenInfo._internal(
       physicalWidth:physicalWidth,
       physicalHeight:physicalHeight,
       dpr:dpr,
       screenWidth:screenWidth,
       screenHeight:screenHeight,
       statusHeight:statusHeight,
       rpx:rpx,
       px: px,

     );

    }
    return _info;
  }
  double setRpx(double size){

    return rpx*size;
  }
  double setPx(double size) {
    return px * size;
  }
}