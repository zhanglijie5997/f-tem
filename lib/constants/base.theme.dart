import '../extension/extension.dart';
import 'dart:ui';

class BaseTheme {
  /// 基础主题色
  static Color get successDark => '#F2DFBB'.color();
  static Color get successLight => '#F2DFBB'.color();

  /// 按钮成功颜色
  static Color get buttonSuccessDark => '#3D3D3D'.color();
  static Color get buttonSuccessLight => '#3D3D3D'.color();

  /// 按钮禁用颜色
  static Color get buttonDisabledDark => '#BBBBBB'.color();
  static Color get buttonDisabledLight => '#BBBBBB'.color();

  /// 说明文字颜色
  static Color get desColorDark => '#999999'.color();
  static Color get desColorLight => '#999999'.color();

  /// 备注文字颜色
  static Color get remarkColorDark => '#666666'.color();
  static Color get remarkColorLight => '#666666'.color();

  /// 备注文字颜色
  static Color get warningColorDark => '#F3B436'.color();
  static Color get warningColorLight => '#F3B436'.color();

  /// 备注文字颜色
  static Color get warningDesColorDark => '#C1874D'.color();
  static Color get warningDesColorLight => '#C1874D'.color();

  /// 折扣文字颜色
  static Color get moneycolorDark => '#F14B4B'.color();
  static Color get moneycolorLight => '#F14B4B'.color();

  /// 选中背景颜色
  static Color get selectBgDark => '#F3B436'.color();
  static Color get selectBgLight => '#F3B436'.color();

  /// 底部导航栏颜色
  static Color get bottomBarBgDark => '#252525'.color();
  static Color get bottomBarBgLight => '#252525'.color();
}
