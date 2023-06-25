import 'package:art_app/hook/notify_hook/notify_hook.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class GlobalServiceController extends GetxService {
  static GlobalServiceController get to => Get.find<GlobalServiceController>();

  /// 用户token
  final _token = (StorageUtils.token).obs;
  String get token => _token.value;

  @override
  void onInit() {
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
  //   final _userMsg = (StorageUtils.userMsg).obs;
  //
  //   // ignore: invalid_use_of_protected_member
  //   Map get userMsg => _userMsg.value;
  //
  //   changeUserMsg(Map v) {
  //     _userMsg.value = v;
  //     StorageUtils.changeUserMsg(v);
  //   }
}
