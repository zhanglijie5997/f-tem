import 'package:captcha_plugin_flutter/captcha_plugin_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  final CaptchaPluginFlutter captchaPlugin = CaptchaPluginFlutter();

  /// 初始化验证码
  void init() {
    CaptchaPluginConfig styleConfig = CaptchaPluginConfig(
        radius: 10,
        capBarTextColor: "#25D4D0",
        capBarTextSize: 18,
        capBarTextWeight: "bold",
        borderColor: "#25D4D0",
        borderRadius: 10,
        backgroundMoving: "#DC143C",
        executeBorderRadius: 10,
        executeBackground: "#DC143C",
        capBarTextAlign: "center",
        capPaddingTop: 10,
        background: "#DC143C",
        capPaddingRight: 10,
        capPaddingBottom: 10,
        capPaddingLeft: 10,
        paddingTop: 15,
        paddingBottom: 15);

    captchaPlugin.init({
      "captcha_id": "054a29844f754634b32524e833e033e1",
      "is_debug": kDebugMode,
      "is_no_sense_mode": false,
      "dimAmount": 0.8,
      "is_touch_outside_disappear": true,
      "timeout": 8000,
      "is_hide_close_button": false,
      "use_default_fallback": true,
      "failed_max_retry_count": 4,
      "loading_text": '',
      // "language_type": "ja",
      "is_close_button_bottom": true,
      "styleConfig": styleConfig.toJson(),
    });
  }

  // 弹出验证码
  void showCaptcha() {
    captchaPlugin.showCaptcha(onLoaded: () {
      print("================onLoaded==============");
    }, onSuccess: (dynamic data) {
      print(data);
    }, onClose: (dynamic data) {
      print(data);
    }, onError: (dynamic data) {
      print(data);
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
