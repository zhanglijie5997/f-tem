import 'package:art_app/extension/extension.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find<ThemeService>();

  final _theemModel = ThemeMode.dark.obs;
  ThemeMode get themeModel => _theemModel.value;

  updateStatusBar() {
    // #兼容web，非web直接打开
    if (!kIsWeb) {
      SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark);

      if (themeModel == ThemeMode.dark) {
        uiStyle = SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light);
      }
      SystemChrome.setSystemUIOverlayStyle(uiStyle);
    }
  }

  updateThemeMode(ThemeMode v) {
    _theemModel.value = v;
    StorageUtils.changeTheme(v);
    Get.changeTheme(
        v == ThemeMode.dark ? ThemeDataConfig.light : ThemeDataConfig.light);
    Get.changeThemeMode(v);
    updateStatusBar();
  }

  init() {
    final _ = {
      ThemeMode.dark.name: ThemeMode.dark,
      ThemeMode.light.name: ThemeMode.light,
    };
    updateThemeMode(_[StorageUtils.theme] ?? ThemeMode.dark);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}

class ThemeDataConfig {
  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
      extensions: [CustomTheme.light()],
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: '#F2DFBB'.color())))));

  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
      extensions: [CustomTheme.dark()],
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: '#F2DFBB'.color())))));

  static ThemeData get custom => ThemeDataConfig.dark;
}

class CustomTheme extends ThemeExtension<CustomTheme> {
  Color? success;
  Color? bottomBar;
  CustomTheme({this.success, this.bottomBar});
  @override
  CustomTheme copyWith({Color? success, Color? bottomBar}) {
    return CustomTheme(success: success, bottomBar: bottomBar);
  }

  @override
  CustomTheme lerp(CustomTheme other, double t) {
    return CustomTheme(success: other.success);
  }

  static CustomTheme light() =>
      CustomTheme(success: '#F2DFBB'.color(), bottomBar: '#252525'.color());

  static CustomTheme dark() =>
      CustomTheme(success: '#F2DFBB'.color(), bottomBar: '#252525'.color());
}
