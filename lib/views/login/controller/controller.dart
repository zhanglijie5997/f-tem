import 'dart:async';

import 'package:art_app/models/app_login_phone/app_login_phone.dart';
import 'package:art_app/services/global/global.services.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/login/services/services.dart';
import 'package:art_app/views/me/services/services.dart';
import 'package:captcha_plugin_flutter/captcha_plugin_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  final CaptchaPluginFlutter captchaPlugin = CaptchaPluginFlutter();
  final phoneReg = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

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
      "is_debug": false,
      "is_no_sense_mode": false,
      "dimAmount": 0.8,
      "is_touch_outside_disappear": true,
      "timeout": 3000,
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
    if (!phoneReg.hasMatch(phoneController.text)) {
      SmartDialog.showToast('请输入正确手机号', alignment: Alignment.center);
      return;
    }
    captchaPlugin.showCaptcha(onLoaded: () {
      print("================onLoaded==============");
    }, onSuccess: (dynamic data) {
      print(data);
      updateTimes(data);
    }, onClose: (dynamic data) {
      print(data);
    }, onError: (dynamic data) {
      print(data);
    });
  }

  /// 选择登陆还是注册
  final _active = 0.obs;
  int get active => _active.value;
  updateActive(v) {
    _active.value = v;
  }

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();

  final _phoneFocusStatus = false.obs;
  bool get phoneFocusStatus => _phoneFocusStatus.value;

  late final FocusNode phoneFocusNode = FocusNode()
    ..addListener(() {
      if (phoneFocusNode.hasFocus) {
        _phoneFocusStatus.value = true;
      }
    });

  final _phone = ''.obs;
  String get phone => _phone.value;
  updatePhone(String v) {
    _phone.value = v;
  }

  final _code = ''.obs;
  String get code => _code.value;
  updateCode(String v) {
    _code.value = v;
  }

  final _inviteCode = ''.obs;
  String get inviteCode => _inviteCode.value;
  updateInviteCode(String v) {
    _inviteCode.value = v;
  }

  /// 发送验证码时间
  final _times = 120.obs;
  int get times => _times.value;
  Timer? timer;
  void updateTimes(dynamic v) async {
    await LoginServices.smsSendSmsCode(SmsSendCodeBodyModel(
        captchaId: '054a29844f754634b32524e833e033e1',
        neCaptchaValidate: v['validate'],
        typeCode: '3',
        phone: phoneController.text));
    if (timer != null) {
      return;
    }

    timer = Timer.periodic(1000.milliseconds, (v) {
      if (_times.value <= 0) {
        _times.value = 120;
        timer?.cancel();
        return;
      }
      _times.value--;
    });
  }

  final _validate = false.obs;
  bool get validate => _validate.value;
  updateValidate(bool v) {
    LogUtil.w('message---- $v');
    _validate.value = v;
  }

  bool validatePhone() {
    return phoneReg.hasMatch(_phone.value);
  }

  final _loading = false.obs;
  bool get loading => _loading.value;
  updateLoading(bool v) {
    _loading.value = v;
  }

  // 提交
  submit() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    updateLoading(true);
    if (!validatePhone()) {
      LogUtil.w('active1 -> $active');

      return;
    }
    if (code.length < 6) {
      LogUtil.w('active2 -> $active');

      return;
    }
    LogUtil.w('active -> $active');
    try {
      if (active == 0) {
        /// 登陆
        final _ = await LoginServices.appLoginPhone(
            AppLoginPhoneBody(phone: phone, code: code, typeCode: 1));
        if (_.data?.data?.token != null) {
          GlobalServiceController.to.updateToken(_.data?.data?.token ?? '');
          GlobalServiceController.to.getUserInfo(_.data);
          //
        }
      } else {
        /// 注册
      }
    } catch (e) {
      LogUtil.e(e);
    } finally {
      Future.delayed(2000.milliseconds, () {
        updateLoading(false);
      });
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    // ever(_phone, (callback) {
    //   LogUtil.w('$callback ${_code.value}');
    //   updateValidate(phoneReg.hasMatch(callback) && _code.value.length == 6);
    // });
    // ever(_code, (callback) {
    //   LogUtil.w('$callback ${_phone.value} ${phoneReg.hasMatch(callback)} ${_code.value.length == 6}');
    //   updateValidate(phoneReg.hasMatch(callback) && _code.value.length == 6);
    // });
    init();
    super.onInit();
  }
}
