import 'package:get/get.dart';

class GlobalServiceController extends GetxService {
  static GlobalServiceController get to => Get.find<GlobalServiceController>();

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