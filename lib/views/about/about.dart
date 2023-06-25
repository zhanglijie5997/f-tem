import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AboutPage')),
        body: const SafeArea(child: Text('AboutController')));
  }
}
