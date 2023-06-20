import 'package:art_app/services/theme/theme.services.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

extension ContextExt on BuildContext {
  CustomTheme? get customTheme => Theme.of(this).extension<CustomTheme>();

  /// 选择图片插件
  /// * [max] 最大选择数量
  /// * [requestType] 选择类型
  Future<List<AssetEntity>?> selectImage(
      {int max = 1, RequestType requestType = RequestType.common}) {
    return AssetPicker.pickAssets(this,
        pickerConfig: AssetPickerConfig(
            maxAssets: max,
            requestType: requestType,
            specialItemPosition: SpecialItemPosition.prepend));
  }
}
