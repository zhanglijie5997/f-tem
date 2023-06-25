import 'package:art_app/components/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:art_app/constants/base.theme.dart';
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
      useMaterial3: false,
      appBarTheme:
          AppBarTheme(backgroundColor: BaseTheme.defaultBgLight, elevation: 0),
      splashFactory: NoSplashFactory(),
      scaffoldBackgroundColor: BaseTheme.defaultBgLight,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 12),
        bodyLarge: TextStyle(fontSize: 16),
      ),
      dividerColor: BaseTheme.bottomBarBgLight,
      dividerTheme: DividerThemeData(
        color: BaseTheme.bottomBarBgLight,
      ),
      iconTheme: IconThemeData(size: 18, color: '#000000'.color()),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: '#F2DFBB'.color())))));

  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
      extensions: [CustomTheme.dark()],
      useMaterial3: false,
      appBarTheme:
          AppBarTheme(backgroundColor: BaseTheme.defaultBgDark, elevation: 0),
      scaffoldBackgroundColor: BaseTheme.defaultBgDark,
      splashFactory: NoSplashFactory(),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 12),
        bodyLarge: TextStyle(fontSize: 16),
      ),
      dividerColor: BaseTheme.bottomBarBgDark,
      dividerTheme: DividerThemeData(
        color: BaseTheme.bottomBarBgDark,
      ),
      iconTheme: IconThemeData(size: 18, color: '#ffffff'.color()),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: '#F2DFBB'.color())))));

  static ThemeData get custom => ThemeDataConfig.dark;
}

class CustomTheme extends ThemeExtension<CustomTheme> {
  Color? success;
  Color? bottomBar;
  Color? money;
  Color? btnSuccess;
  Color? btnDisabled;
  Color? desColor;
  Color? remarkColor;
  Color? warningColor;
  Color? warningDesColor;
  Color? selectBg;
  Color? tagBg;
  Color? tagText;
  Color? subtitle;
  TextStyle? body18;
  CustomTheme(
      {this.success,
      this.bottomBar,
      this.money,
      this.btnSuccess,
      this.btnDisabled,
      this.desColor,
      this.remarkColor,
      this.warningColor,
      this.warningDesColor,
      this.selectBg,
      this.tagBg,
      this.tagText,
      this.subtitle,
      this.body18});
  @override
  CustomTheme copyWith(
      {Color? success,
      Color? bottomBar,
      Color? money,
      Color? btnSuccess,
      Color? btnDisabled,
      Color? desColor,
      Color? remarkColor,
      Color? warningColor,
      Color? warningDesColor,
      Color? selectBg,
      Color? tagBg,
      Color? tagText,
      Color? subtitle,
      TextStyle? body18}) {
    return CustomTheme(
        success: success,
        bottomBar: bottomBar,
        money: money,
        btnSuccess: btnSuccess,
        btnDisabled: btnDisabled,
        desColor: desColor,
        remarkColor: remarkColor,
        warningColor: warningColor,
        warningDesColor: warningDesColor,
        selectBg: selectBg,
        tagBg: tagBg,
        tagText: tagText,
        subtitle: subtitle,
        body18: body18);
  }

  @override
  CustomTheme lerp(CustomTheme other, double t) {
    return CustomTheme(success: other.success);
  }

  static CustomTheme light() => CustomTheme(
      success: BaseTheme.successLight,
      bottomBar: BaseTheme.bottomBarBgLight,
      money: BaseTheme.moneycolorLight,
      btnSuccess: BaseTheme.buttonSuccessLight,
      btnDisabled: BaseTheme.buttonDisabledLight,
      desColor: BaseTheme.desColorLight,
      remarkColor: BaseTheme.remarkColorLight,
      warningColor: BaseTheme.warningColorLight,
      warningDesColor: BaseTheme.warningDesColorLight,
      selectBg: BaseTheme.selectBgLight,
      tagBg: BaseTheme.tagBgLight,
      tagText: BaseTheme.tagTextLight,
      subtitle: BaseTheme.subtitleLight,
      body18: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600));

  static CustomTheme dark() => CustomTheme(
      success: BaseTheme.successDark,
      bottomBar: BaseTheme.bottomBarBgLight,
      money: BaseTheme.moneycolorDark,
      btnSuccess: BaseTheme.buttonSuccessDark,
      btnDisabled: BaseTheme.buttonDisabledDark,
      desColor: BaseTheme.desColorDark,
      remarkColor: BaseTheme.remarkColorDark,
      warningColor: BaseTheme.warningColorDark,
      warningDesColor: BaseTheme.warningDesColorDark,
      selectBg: BaseTheme.selectBgDark,
      tagBg: BaseTheme.tagBgDark,
      tagText: BaseTheme.tagTextDark,
      subtitle: BaseTheme.subtitleDark,
      body18: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
}
