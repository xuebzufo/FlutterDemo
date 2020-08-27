
import 'package:favorcate/ui/shared/screen_auto.dart';

extension PointTransformation on int{
  double get px{
    return ScreenInfo.instance.setPx(this.toDouble());
  }
  double get rpx{
    return ScreenInfo.instance.setRpx(this.toDouble());
  }
}