import 'dart:ui';

extension HexColor on Color {
  String toHex() {
    return '#${(0xFFFFFF & value).toRadixString(16).padLeft(6, '0')}';
  }
}
