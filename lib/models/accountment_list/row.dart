import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'row.g.dart';

@JsonSerializable()
class Row extends Equatable {
  final String? id;
  final dynamic typeName;
  final String? title;
  final String? publishTime;
  final String? imgUrl;
  final int? readFlag;

  const Row({
    this.id,
    this.typeName,
    this.title,
    this.publishTime,
    this.imgUrl,
    this.readFlag,
  });

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);

  Map<String, dynamic> toJson() => _$RowToJson(this);

  Row copyWith({
    String? id,
    dynamic typeName,
    String? title,
    String? publishTime,
    String? imgUrl,
    int? readFlag,
  }) {
    return Row(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
      title: title ?? this.title,
      publishTime: publishTime ?? this.publishTime,
      imgUrl: imgUrl ?? this.imgUrl,
      readFlag: readFlag ?? this.readFlag,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      typeName,
      title,
      publishTime,
      imgUrl,
      readFlag,
    ];
  }
}
