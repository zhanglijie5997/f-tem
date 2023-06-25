import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class ResaleView extends GetView<ResaleController> {
  const ResaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ExchangePage')),
        body: SafeArea(child: Text('ResaleController')));
  }
}
