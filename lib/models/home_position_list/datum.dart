import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final int? current;
  final int? rows;
  final String? id;
  final String? createDate;
  final String? updateDate;
  final String? createBy;
  final String? updateBy;
  final bool? delFlag;
  final String? name;
  final String? logoImg;
  final int? sortChart;
  final int? pageType;
  final String? redirectUrl;
  final int? state;
  final dynamic userId;

  const Datum({
    this.current,
    this.rows,
    this.id,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.delFlag,
    this.name,
    this.logoImg,
    this.sortChart,
    this.pageType,
    this.redirectUrl,
    this.state,
    this.userId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? current,
    int? rows,
    String? id,
    String? createDate,
    String? updateDate,
    String? createBy,
    String? updateBy,
    bool? delFlag,
    String? name,
    String? logoImg,
    int? sortChart,
    int? pageType,
    String? redirectUrl,
    int? state,
    dynamic userId,
  }) {
    return Datum(
      current: current ?? this.current,
      rows: rows ?? this.rows,
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      createBy: createBy ?? this.createBy,
      updateBy: updateBy ?? this.updateBy,
      delFlag: delFlag ?? this.delFlag,
      name: name ?? this.name,
      logoImg: logoImg ?? this.logoImg,
      sortChart: sortChart ?? this.sortChart,
      pageType: pageType ?? this.pageType,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      state: state ?? this.state,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props {
    return [
      current,
      rows,
      id,
      createDate,
      updateDate,
      createBy,
      updateBy,
      delFlag,
      name,
      logoImg,
      sortChart,
      pageType,
      redirectUrl,
      state,
      userId,
    ];
  }
}
