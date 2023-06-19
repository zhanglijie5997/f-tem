import 'package:art_app/utils/log/log.utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/qr_code_view.dart';
import 'controller/controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: AppBar(
        toolbarHeight: 45,
        title: const Text(''),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: QrcodeReaderView(
              onScan: (v) async {
                LogUtil.w(v);
              },
            ),
          ),
          Container(
            height: context.mediaQueryPadding.bottom + 20,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
