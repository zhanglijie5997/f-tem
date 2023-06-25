import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('CouponPage')),
        body: const Placeholder());
  }
}
