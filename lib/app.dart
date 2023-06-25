import 'package:art_app/router/router.dart';
import 'package:art_app/router/router.observer.dart';
import 'package:art_app/services/language/language.services.dart';
import 'package:art_app/services/theme/theme.services.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:screenshot_callback/screenshot_callback.dart';
import 'dart:ui' as ui;
import 'generated/locales.g.dart';

class App extends StatelessWidget {
  App({super.key});
  final GlobalKey globalkey = GlobalKey();
  // This widget is the root of your application.
  Widget _buildAnnotatedRegion(BuildContext context, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Get.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: child,
    );
  }

  Future<Uint8List> capture() async {
    // /RenderRepaintBoundary
    RenderBox? boundary =
        globalkey.currentContext?.findRenderObject() as RenderBox;
    boundary as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void _screenShotListener(BuildContext context) {
    ScreenshotCallback screenshotCallback = ScreenshotCallback();
    screenshotCallback.addListener(() async {
      final image = await capture();
      LogUtil.d('截屏成功');

      SmartDialog.show(
          builder: (c) => SizedBox(
                width: context.mediaQuerySize.width * .9,
                height: context.mediaQuerySize.height * .9,
                child: Image.memory(image),
              ));
    });
  }

  MediaQuery _buildFontSize(BuildContext context, Widget child) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child);
  }

  Widget _buildBottomPaddingVerticalShield(BuildContext context) {
    return PositionedDirectional(
      start: 0,
      end: 0,
      bottom: 0,
      height: MediaQuery.of(context).padding.bottom,
      child: GestureDetector(
        onTap: () {
          print("object");
        },
        // behavior: HitTestBehavior.translucent,
        onVerticalDragStart: (_) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.w('reset');
    return RepaintBoundary(
      key: globalkey,
      child: GetMaterialApp(
        getPages: RoutePages.page,
        initialRoute: RoutesName.root,
        unknownRoute: RoutePages.unknowPage,
        locale: LanguageService.to.language,
        fallbackLocale: const Locale('en', 'US'),
        supportedLocales: const [
          Locale('en', 'US'), // English, no country code
          Locale('es', ''), // Spanish, no country code
          Locale('zh', 'CN'), // Chinese, no country code
        ],
        localizationsDelegates: const [
          // AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: FlutterSmartDialog.init(builder: (context, child) {
          _buildAnnotatedRegion(context, child!);
          _buildBottomPaddingVerticalShield(context);
          _screenShotListener(context);
          return _buildFontSize(context, child);
        }),
        navigatorObservers: [GetXRouterObserver(), FlutterSmartDialog.observer],
        // home: Test1(),
        translationsKeys: AppTranslation.translations,
        initialBinding: BindingsBuilder(() {}),
        theme: ThemeDataConfig.light,
        darkTheme: ThemeDataConfig.dark,
        themeMode: ThemeService.to.themeModel,
      ),
    );
  }
}
