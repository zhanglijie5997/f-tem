import 'package:art_app/views/home/binding/binding.dart';
import 'package:art_app/views/market/binding/binding.dart';
import 'package:art_app/views/me/binding/binding.dart';
import 'package:art_app/views/message/binding/binding.dart';
import 'package:art_app/views/root/binding/binding.dart';
import 'package:art_app/views/root/root.dart';
import 'package:art_app/views/unknow/unknow.dart';
import 'package:art_app/views/webview/binding/binding.dart';
import 'package:art_app/views/webview/webview.dart';
import 'package:get/get.dart';

final class RoutesName {
  static String get root => '/';
  static String get webview => '/webview';
  static String get unknow => '/unknow';
}

final class RoutePages {
  static GetPage get unknowPage =>
      GetPage(name: RoutesName.unknow, page: () => const UnknowView());

  static List<GetPage> get page => [
        GetPage(name: RoutesName.root, page: () => const RootView(), bindings: [
          RootBinding(),
          HomeBinding(),
          MeBinding(),
          MarketBinding(),
          MessageBinding()
        ]),
        GetPage(
            name: RoutesName.webview,
            page: () => const WebviewView(),
            binding: WebviewBinding())
      ];
}
