import 'dart:convert';

extension MapExtension on Map {
  String encode() => jsonEncode(this);
}
