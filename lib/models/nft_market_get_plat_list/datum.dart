import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final String? plateId;
  final String? name;
  final String? labelStr;
  final int? label;

  const Datum({this.plateId, this.name, this.labelStr, this.label});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    String? plateId,
    String? name,
    String? labelStr,
    int? label,
  }) {
    return Datum(
      plateId: plateId ?? this.plateId,
      name: name ?? this.name,
      labelStr: labelStr ?? this.labelStr,
      label: label ?? this.label,
    );
  }

  @override
  List<Object?> get props => [plateId, name, labelStr, label];
}
