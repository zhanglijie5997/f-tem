import 'package:art_app/extension/widget/widget.ext.dart';
import 'package:art_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}


class _MeViewState extends State<MeView> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: const Placeholder().onTap(() {
        Get.toNamed(RoutesName.scan);
      }),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}