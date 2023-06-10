import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController get to => Get.find<MessageController>();
  final ScrollController scrollController = ScrollController();
}
