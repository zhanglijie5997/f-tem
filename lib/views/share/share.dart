import 'package:art_app/views/share/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareView extends GetView<ShareController> {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ShareView')),
        body: SafeArea(child: Text('ShareViewroller')));
  }
}
