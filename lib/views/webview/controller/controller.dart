import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

final class OptionsModel {

  late int id;
  late String name;
  late Icon icon;

  OptionsModel({required this.id,required this.name, required this.icon });

  OptionsModel.fromJson(Map<String, dynamic> json){
      id = json['id'];
      name = json['name'];
      icon = json['icon'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['icon'] = icon;
    return data;
  }
}

class WebviewController extends GetxController {
  static WebviewController get to => Get.find<WebviewController>();

  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions get webViewOptions => InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  List<OptionsModel> get options => [
    OptionsModel(icon: const Icon(Icons.refresh_rounded, size: 24,), id: 0, name: '刷新')
  ];

  final _progress = (10.0).obs;
  double get progress => _progress.value;

  void updateProgress(double v) {
    _progress.value = v;
  }

  final _title = ''.obs;
  String get title => _title.value;

  updateTitle(String v) {
    _title.value = v;
  }

  final _active = true.obs;
  bool get active => _active.value;

  void updateActive(bool v) {
    _active.value = v;
  }

  @override
  void onInit() {

    super.onInit();
  }
}