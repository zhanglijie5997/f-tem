import 'dart:io';
import 'dart:convert' as convert;

import 'theme.bin.dart';

class IconFontModel {
  String? id;
  String? name;
  String? fontFamily;
  String? cssPrefixText;
  String? description;
  List<Glyphs>? glyphs;

  IconFontModel(
      {this.id,
      this.name,
      this.fontFamily,
      this.cssPrefixText,
      this.description,
      this.glyphs});

  IconFontModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fontFamily = json['font_family'];
    cssPrefixText = json['css_prefix_text'];
    description = json['description'];
    if (json['glyphs'] != null) {
      glyphs = <Glyphs>[];
      json['glyphs'].forEach((v) {
        glyphs!.add(Glyphs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['font_family'] = fontFamily;
    data['css_prefix_text'] = cssPrefixText;
    data['description'] = description;
    if (glyphs != null) {
      data['glyphs'] = glyphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Glyphs {
  String? iconId;
  String? name;
  String? fontClass;
  String? unicode;
  int? unicodeDecimal;

  Glyphs(
      {this.iconId,
      this.name,
      this.fontClass,
      this.unicode,
      this.unicodeDecimal});

  Glyphs.fromJson(Map<String, dynamic> json) {
    iconId = json['icon_id'];
    name = json['name'];
    fontClass = json['font_class'];
    unicode = json['unicode'];
    unicodeDecimal = json['unicode_decimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon_id'] = iconId;
    data['name'] = name;
    data['font_class'] = fontClass;
    data['unicode'] = unicode;
    data['unicode_decimal'] = unicodeDecimal;
    return data;
  }
}

void main() {
  initIconfont();
}

void initIconfont() {
  final file = File('./assets/fonts/iconfont.json');
  if (file.existsSync()) {
    final str = file.readAsStringSync();
    final res = IconFontModel.fromJson(convert.jsonDecode(str));
    print(res);
    String data = '';
    for (var i = 0; i < (res.glyphs?.length ?? 0); i++) {
      final tem = res.glyphs?[i];
      data +=
          'static const IconData ${tem?.fontClass?.replaceAll(RegExp(r'-'), '_')} = IconData(0x${tem?.unicode}, fontFamily: _family);\n';
    }
    String result = '''
      import 'package:flutter/widgets.dart';
      class IconFont{
        static const String _family = '${res.fontFamily}';
        IconFont._();
        $data
      }
    ''';
    writeFile('./lib/constants/constants.dart', result, type: 'iconfont');
    print(result);
  }
}
