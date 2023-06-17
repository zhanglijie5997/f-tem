import 'package:art_app/extension/widget/widget.ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginPage')), 
      body: const Placeholder().onTap(() {
        controller.showCaptcha();
      }));
  }
}
