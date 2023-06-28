import 'package:art_app/hook/notify/notify.hook.dart';
import 'package:art_app/models/app_login_phone/app_login_phone.dart';
import 'package:art_app/models/wx_user/wx_user.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:art_app/views/me/services/services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class GlobalServiceController extends GetxService {
  static GlobalServiceController get to => Get.find<GlobalServiceController>();
  final _userMsg = (StorageUtils.userMsg).obs;
  // ignore: invalid_use_of_protected_member
  WxUser get userMsg => _userMsg.value;

  updateUserMsg(WxUser v) {
    _userMsg.value = v;
    StorageUtils.changeUserMsg(v);
  }

  /// 用户token
  final _token = (StorageUtils.token).obs;
  String get token => _token.value;
  updateToken(String v) {
    _token.value = v;
    StorageUtils.changeToken(v);
    if (v.isEmpty) {
      updateUserMsg(const WxUser());
      return;
    }
    Get.back();
  }

  getUserInfo([AppLoginPhone? _]) async {
    final id =
        GlobalServiceController.to.userMsg.data?.id ?? _?.data?.userId ?? '';
    final user = await MeServices.wxUser(id);
    if (user.data != null) {
      GlobalServiceController.to.updateUserMsg(user.data!);
    }
  }

  loginOut() {
    updateToken('');
  }

  toLogin(Function callback) {
    if (token.isEmpty) {
      Get.toNamed(RoutesName.login);
    } else {
      callback();
    }
  }

  @override
  void onInit() {
    LogUtil.w('usermsg -> ${StorageUtils.box.read(StoreName.USERMSG)}');
    NotificationUtils.createTestChannel('Editable channel');
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    // AwesomeNotifications().actionStream.listen((ReceivedNotification receivedNotification) {
    //   LogUtil.w('收到推送 => ${receivedNotification.id}');
    // });
    super.onInit();
  }
}
