import 'package:art_app/services/theme/theme.services.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  CustomTheme? get customTheme => Theme.of(this).extension<CustomTheme>();
}