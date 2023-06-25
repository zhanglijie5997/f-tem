import 'package:art_app/extension/extension.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/services/global/global.services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomLoginWidget extends StatelessWidget {
  Widget loginWidget;
  Widget notLoginWidget;
  CustomLoginWidget(
      {super.key, required this.loginWidget, required this.notLoginWidget});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GlobalServiceController.to.token.isNotEmpty
        ? loginWidget
        : notLoginWidget.onTap(() {
            Get.toNamed(RoutesName.login);
          }));
  }
}
