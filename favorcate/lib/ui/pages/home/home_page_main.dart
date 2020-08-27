import 'package:favorcate/core/const/channel_const.dart';
import 'package:flutter/material.dart';
import 'home_page_content.dart';
class SQHomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
        leading: IconButton(
          icon:Icon(Icons.build),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          BatteryInfoShow(),
        ],
      ),
      body: SQHomeContent(),
    );
  }

}
class BatteryInfoShow extends StatefulWidget {
  @override
  _BatteryInfoShowState createState() => _BatteryInfoShowState();
}

class _BatteryInfoShowState extends State<BatteryInfoShow> {
  int _batteryRemains=0;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.battery_unknown),
          Text('剩余电量:$_batteryRemains')
        ],

      ),
      onPressed:getBatteryInfo ,
    );
  }
  getBatteryInfo() async{
   int result = await batteryPlatform.invokeMethod("getBatteryInfo");
    setState(() {
      _batteryRemains = result;
    });
  }
}
