import 'package:art_app/http/http.dart';
import 'package:art_app/models/app_login_phone/app_login_phone.dart';
import 'package:art_app/models/response/response.dart';
import 'package:art_app/models/sms_send_code_model/sms_send_code_model.dart';

class SmsSendCodeBodyModel {
  String? captchaId;
  String? neCaptchaValidate;
  String? phone;
  String? typeCode;

  SmsSendCodeBodyModel(
      {this.captchaId, this.neCaptchaValidate, this.phone, this.typeCode});

  SmsSendCodeBodyModel.fromJson(Map<String, dynamic> json) {
    captchaId = json['captchaId'];
    neCaptchaValidate = json['neCaptchaValidate'];
    phone = json['phone'];
    typeCode = json['typeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['captchaId'] = captchaId;
    data['neCaptchaValidate'] = neCaptchaValidate;
    data['phone'] = phone;
    data['typeCode'] = typeCode;
    return data;
  }
}

class AppLoginPhoneBody {
  String? code;
  String? phone;
  int? typeCode;

  AppLoginPhoneBody({this.code, this.phone, this.typeCode});

  AppLoginPhoneBody.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    phone = json['phone'];
    typeCode = json['typeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['phone'] = phone;
    data['typeCode'] = typeCode;
    return data;
  }
}

abstract class LoginServicesUrl {
  static get smsSendSmsCode => '/api/app/sms/sendSmsCode';
  static get appLoginPhone => '/api/app/login/phone';
}

class LoginServices {
  /// 发送验证码
  static Future<ResponseModel<SmsSendCodeModel>> smsSendSmsCode(
      SmsSendCodeBodyModel v) {
    return HttpUtil.fetchModel<SmsSendCodeModel>(FetchType.post,
        url: LoginServicesUrl.smsSendSmsCode, body: v.toJson());
  }

  /// 手机号登录
  static Future<ResponseModel<AppLoginPhone>> appLoginPhone(
      AppLoginPhoneBody v) {
    return HttpUtil.fetchModel<AppLoginPhone>(FetchType.post,
        url: LoginServicesUrl.appLoginPhone, body: v.toJson());
  }
}
