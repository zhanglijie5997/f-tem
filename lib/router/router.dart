import 'package:art_app/views/home/binding/binding.dart';
import 'package:art_app/views/me/binding/binding.dart';
import 'package:art_app/views/root/binding/binding.dart';
import 'package:art_app/views/root/root.dart';
import 'package:art_app/views/unknow/unknow.dart';
import 'package:get/get.dart';

final class RoutesName {
  static String get root => '/';
  static String get me => '/me';
  static String get unknow => '/unknow';

}

final class RoutePages {

  static GetPage get unknowPage => GetPage(name: RoutesName.unknow, page: () => const UnknowView());

  static List<GetPage> get page => [
    GetPage(name: RoutesName.root, page: () => const RootView(), bindings: [RootBinding(), HomeBinding(), MeBinding()])
  ];
}