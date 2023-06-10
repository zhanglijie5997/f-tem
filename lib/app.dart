import 'package:art_app/router/router.dart';
import 'package:art_app/router/router.observer.dart';
import 'package:art_app/services/language/language.services.dart';
import 'package:art_app/services/theme/theme.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/locales.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  Widget _buildAnnotatedRegion(BuildContext context, Widget child) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Get.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: child,
    );
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
    return GetMaterialApp(
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
      builder: FlutterSmartDialog.init(builder: (context,child)  {
        _buildAnnotatedRegion(context, child!);
        _buildBottomPaddingVerticalShield(context);
        
        return child;
      }) ,
      navigatorObservers: [
        GetXRouterObserver(),
        FlutterSmartDialog.observer
      ],
      translationsKeys: AppTranslation.translations,
      initialBinding: BindingsBuilder(() {}),
      theme: ThemeDataConfig.light,
      darkTheme: ThemeDataConfig.dark,
      themeMode: ThemeService.to.themeModel,
    );
  }
}
