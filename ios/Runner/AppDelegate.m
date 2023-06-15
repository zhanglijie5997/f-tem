#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "DCUniMP.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
  // Override point for customization after application launch.
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    id<FlutterBinaryMessenger> binaryMessenger = [flutterViewController binaryMessenger];
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_openim_unimp" binaryMessenger:binaryMessenger];
    NSLog(@"channel: %@", channel);
    
    //往方法通道注册方法调用处理回调
      [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
          if ([@"isInitialize" isEqualToString:call.method]) {
              NSLog(@"isInitialize");
          }
          NSLog(@"注册成功");
          if ([call.method isEqualToString:@"releaseWgtToRunPath"]) {
                  NSString *appID = call.arguments[@"appID"];
                  NSString *wgtPath = call.arguments[@"wgtPath" ];
                  NSString *password = [call.arguments[@"password"]isEqual:[NSNull null]] ? nil : call.arguments[@"password"];
                  NSError *err = nil;
                  
                  BOOL r = [DCUniMPSDKEngine installUniMPResourceWithAppid:appID
                                                               resourceFilePath:wgtPath
                                                                       password:password
                                                                          error:&err];
                  result(r ? @(r) : err.userInfo);
              } else if ([call.method isEqualToString:@"openUniMP"]) {
                  NSString *appID = call.arguments[@"appID"];
                  DCUniMPConfiguration *configuration = [DCUniMPConfiguration new];
                  configuration.enableBackground = YES;
                  [DCUniMPSDKEngine openUniMP:appID configuration:configuration completed:^(DCUniMPInstance * _Nullable uniMPInstance, NSError * _Nullable error) {
                      if (uniMPInstance != nil) {
                          NSLog(@"小程序打开成功");
                          result(@YES);
                      } else {
                          NSLog(@"打开小程序出错：%@", error);
                          result(error.userInfo);
                      }
                  }];
              } else if ([call.method isEqualToString:@"closeUniMP"]) {
                  [DCUniMPSDKEngine closeUniMP];
              }
              else if ([call.method isEqualToString:@"getAppVersionInfo"]) {
                  NSString *appID = call.arguments[@"appID"];
                  NSDictionary *info = [DCUniMPSDKEngine getUniMPVersionInfoWithAppid:appID];
                  
                  result(info);
              } else if ([call.method isEqualToString:@"sendUniMPEvent"]) {
                  NSString *appID = call.arguments[@"appID"];
                  NSString *event = call.arguments[@"event"];
                  NSString *data = call.arguments[@"data"];
                  
                  DCUniMPInstance *instance = [DCUniMPInstance new];
                  [instance sendUniMPEvent:event data:data];
                  
                  result(@YES);
              } else if ([call.method isEqualToString:@"isInitialize"]) {
                  //                DCUniMPSDKEngine.is
//                  DCUniMPSDK *instance = DCUniMPSDK.getInstance().isInitialize();

              } else if ([call.method isEqualToString:@"destory"]) {
                  [DCUniMPSDKEngine destory];
              } else if ([@"getPlatformVersion" isEqualToString:call.method]) {
                  result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
              } else {
                  NSLog(@"无方法");
                  result(FlutterMethodNotImplemented);
              }
      }];
   
    [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end

