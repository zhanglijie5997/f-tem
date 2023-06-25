import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  const PurchaseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('AskBuyview')),
        body: SafeArea(child: Text('AskBuyviewroller')));
  }
}
