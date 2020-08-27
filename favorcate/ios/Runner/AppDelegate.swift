import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let viewController:FlutterViewController =  window.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "xsq.com/battery", binaryMessenger: viewController.binaryMessenger)
    channel.setMethodCallHandler { (call:FlutterMethodCall,result: @escaping FlutterResult) in
        guard call.method == "getBatteryInfo" else{
            result(FlutterMethodNotImplemented)
            return
        }
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
         result(Int(device.batteryLevel * 100))
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
