import 'package:art_app/middleware/middleware.dart';
import 'package:art_app/views/about/about.dart';
import 'package:art_app/views/about/binding/binding.dart';
import 'package:art_app/views/announcement_detail/binding/binding.dart';
import 'package:art_app/views/coupon/binding/binding.dart';
import 'package:art_app/views/coupon/coupon.dart';
import 'package:art_app/views/help/binding/binding.dart';
import 'package:art_app/views/help/help.dart';
import 'package:art_app/views/home/binding/binding.dart';
import 'package:art_app/views/login/binding/binding.dart';
import 'package:art_app/views/login/login.dart';
import 'package:art_app/views/market/binding/binding.dart';
import 'package:art_app/views/me/binding/binding.dart';
import 'package:art_app/views/message/binding/binding.dart';
import 'package:art_app/views/order/purchase/purchase.dart';
import 'package:art_app/views/order/purchase/binding/binding.dart';
import 'package:art_app/views/order/resale/binding/binding.dart';
import 'package:art_app/views/order/resale/resale.dart';
import 'package:art_app/views/order/regular/bindging/bindging.dart';
import 'package:art_app/views/order/regular/routine.dart';
import 'package:art_app/views/root/binding/binding.dart';
import 'package:art_app/views/root/root.dart';
import 'package:art_app/views/scan/scan.dart';
import 'package:art_app/views/share/binding/binding.dart';
import 'package:art_app/views/share/share.dart';
import 'package:art_app/views/unknow/unknow.dart';
import 'package:art_app/views/webview/binding/binding.dart';
import 'package:art_app/views/webview/webview.dart';
import 'package:get/get.dart';

import '../views/announcement_detail/announcement_detail.dart';
import '../views/scan/binding/binding.dart';

final class RoutesName {
  static String get root => '/';
  static String get webview => '/webview';
  static String get scan => '/scan';
  static String get login => '/login';
  static String get unknow => '/unknow';
  static String get announcementDetail => '/announcementDetail';
  static String get share => '/share';
  static String get coupon => '/coupon';
  static String get about => '/about';
  static String get help => '/help';
  static String get purchaseOrder => '/purchaseOrder';
  static String get resaleOrder => '/resaleOrder';
  static String get regularOrder => '/regularOrder';
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
            binding: WebviewBinding()),
        GetPage(
            name: RoutesName.scan,
            page: () => const ScanView(),
            binding: ScanBinding()),
        GetPage(
            name: RoutesName.login,
            page: () => const LoginView(),
            binding: LoginBinding()),
        GetPage(
            name: '${RoutesName.announcementDetail}/:id',
            page: () => const AnnouncementDetailView(),
            binding: AnnoouncementDetailBinding()),
        GetPage(
            name: RoutesName.share,
            page: () => const ShareView(),
            binding: ShareBinding()),
        GetPage(
            name: RoutesName.purchaseOrder,
            page: () => const PurchaseView(),
            binding: PurchaseBinding(),
            middlewares: [AuthorMiddlewares()]),
        GetPage(
            name: RoutesName.resaleOrder,
            page: () => const ResaleView(),
            binding: ResaleBinding(),
            middlewares: [AuthorMiddlewares()]),
        GetPage(
            name: RoutesName.regularOrder,
            page: () => const RegularView(),
            binding: RoutineBinding(),
            middlewares: [AuthorMiddlewares()]),
        GetPage(
            name: RoutesName.help,
            page: () => const HelpView(),
            binding: HelpBinding()),
        GetPage(
            name: RoutesName.about,
            page: () => const AboutView(),
            binding: AboutBinding()),
        GetPage(
            name: RoutesName.coupon,
            page: () => const CouponView(),
            binding: CouponBinding()),
      ];
}
