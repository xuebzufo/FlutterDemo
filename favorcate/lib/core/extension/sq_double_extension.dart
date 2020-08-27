import 'package:favorcate/ui/shared/screen_auto.dart';
extension PointTransformation on double{
  double get px{
    return ScreenInfo.instance.setPx(this);
  }
  double get rpx{
    return ScreenInfo.instance.setRpx(this);
  }
}