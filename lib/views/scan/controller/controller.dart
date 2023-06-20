import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  static ScanController get to => Get.find<ScanController>();
  final double width = 320;
  final _qrController = QrReaderViewController(1).obs;
  QrReaderViewController get qrController => _qrController.value;
  updateQrController(QrReaderViewController v) {
    _qrController.value = v;
  }

  Future<bool> permission() async {
    var status = await Permission.camera.status;
    print(status);
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.camera.request();
      print(status);
    }

    if (status.isRestricted) {
      // alert("请必须授权照相机权限");
      await Future.delayed(const Duration(seconds: 3));
      openAppSettings();
      // _openAction = false;
      return false;
    }

    if (!status.isGranted) {
      // alert("请必须授权照相机权限");
      // _openAction = false;
      return false;
    }
    // _openAction = false;
    return true;
  }

  @override
  void onInit() {
    permission().then((v) {
      print(v);
    });
    super.onInit();
  }
}
