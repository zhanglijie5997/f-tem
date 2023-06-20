import 'package:art_app/utils/log/log.utils.dart';
import 'package:permission_handler/permission_handler.dart';

final class PermissionHook {
  /// 相机状态
  static Future<PermissionStatus> get camera => Permission.camera.status;

  /// 通讯录权限
  static Future<PermissionStatus> get contacts => Permission.contacts.status;

  /// 本地存储权限
  static Future<PermissionStatus> get storage => Permission.storage.status;

  /// 通知权限
  static Future<PermissionStatus> get notification =>
      Permission.notification.status;

  /// 媒体库
  static Future<PermissionStatus> get mediaLibrary =>
      Permission.mediaLibrary.status;

  /// 请求相机权限
  static void requestCamera(Function fn) async {
    if (!(await camera.isGranted)) {
      /// 去打开权限
      LogUtil.w('相机权限未开启，去开启权限');
      return;
    }
    fn.call();
  }

  /// 请求通讯录权限
  static void requestContacts(Function fn) async {
    if (!(await contacts.isGranted)) {
      /// 去打开权限
      LogUtil.w('通讯录权限未开启，去开启权限');
      return;
    }
    fn.call();
  }

  /// 请求本地存储权限
  static requestStorage(Function fn) async {
    if (!(await storage.isGranted)) {
      LogUtil.w('存储权限未开启，去开启权限');
      return;
    }
    fn.call();
  }

  /// 请求通知权限
  static requestNotification(Function fn) async {
    if (!(await notification.isGranted)) {
      LogUtil.w('通知权限未开启，去开启权限');
      return;
    }
    fn.call();
  }

  /// 请求媒体库权限
  static requestMediaLibrary(Function fn) async {
    if (!(await mediaLibrary.isGranted)) {
      LogUtil.w('存储权限未开启，去开启权限');
      return;
    }
    fn.call();
  }
}
