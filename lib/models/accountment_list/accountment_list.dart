import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'row.dart';

part 'accountment_list.g.dart';

@JsonSerializable()
class AccountmentList extends Equatable {
  final List<Row>? rows;
  final int? total;

  const AccountmentList({this.rows, this.total});

  factory AccountmentList.fromJson(Map<String, dynamic> json) {
    return _$AccountmentListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountmentListToJson(this);

  AccountmentList copyWith({
    List<Row>? rows,
    int? total,
  }) {
    return AccountmentList(
      rows: rows ?? this.rows,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [rows, total];
}
