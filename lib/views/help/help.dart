import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HelpPage')),
        body: const SafeArea(child: Text('HelpController')));
  }
}
