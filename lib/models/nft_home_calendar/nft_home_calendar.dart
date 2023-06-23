import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'row.dart';

part 'nft_home_calendar.g.dart';

@JsonSerializable()
class NftHomeCalendar extends Equatable {
  final List<Row>? rows;
  final int? total;

  const NftHomeCalendar({this.rows, this.total});

  factory NftHomeCalendar.fromJson(Map<String, dynamic> json) {
    return _$NftHomeCalendarFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NftHomeCalendarToJson(this);

  NftHomeCalendar copyWith({
    List<Row>? rows,
    int? total,
  }) {
    return NftHomeCalendar(
      rows: rows ?? this.rows,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [rows, total];
}
