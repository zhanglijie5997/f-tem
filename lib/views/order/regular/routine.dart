import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class RegularView extends GetView<RegularController> {
  const RegularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RoutinePage')),
        body: SafeArea(child: Text('RoutineController')));
  }
}
