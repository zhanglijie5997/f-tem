import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../utils/log/log.utils.dart';
import '../models.dart';

const JsonEncoder globalJsonEncoder = JsonEncoder.withIndent('  ');

typedef Json = Map<String, dynamic>;

class ModelError extends TypeError {}

abstract class DataModel extends Equatable {
  const DataModel();

  Json toJson();

  @override
  String toString() => globalJsonEncoder.convert(toJson());
}

class ModelMakeError<T> extends ModelError {
  ModelMakeError(this.json, this.error);

  final Json json;
  final Object error;
}

class ModelNotRegisteredError<T> extends ModelError {
  ModelNotRegisteredError();

  @override
  String toString() {
    return "You're inflating an unregistered type: $T\n"
        "Please check if it's registered in `dataModelFactories`.";
  }
}

T makeModel<T>(Json json) {
  // LogUtil.w('==== 🔥 Logoutput self: ${dataModelFactories}====');
  if (!dataModelFactories.containsKey(T)) {
    LogUtil.e(
      "You're inflating an unregistered type: $T\n"
      "Please check if it's registered in `dataModelFactories`.",
      tag: '🏭 DataModel',
    );
    throw ModelNotRegisteredError<T>();
  }
  try {
    return dataModelFactories[T]!(json) as T;
  } catch (e, s) {
    LogUtil.e(
      'Error when making model with $T type: $e\n'
      'The raw data which make this error is: '
      '${globalJsonEncoder.convert(json)}',
      stackTrace: s,
      tag: '🏭 DataModel',
    );
    throw ModelMakeError<T>(json, e);
  }
}

class ResponseModel<T> {
  const ResponseModel({
    required this.code,
    required this.msg,
    this.timestamp,
    this.rawData,
    this.data,
    this.page,
    this.total,
    this.canLoadMore = false,
    this.models,
    this.cursor,
  });

  const ResponseModel.succeed(
      {this.rawData,
      this.data,
      this.page,
      this.total,
      this.canLoadMore = false,
      this.models,
      this.cursor,
      this.timestamp})
      : code = codeSucceed,
        msg = '';

  const ResponseModel.failed(
      {required this.msg,
      this.rawData,
      this.data,
      this.page,
      this.total,
      this.canLoadMore = false,
      this.models,
      this.cursor,
      this.timestamp})
      : code = codeFailed;

  const ResponseModel.cancelled(
      {required this.msg,
      this.rawData,
      this.data,
      this.page,
      this.total,
      this.canLoadMore = false,
      this.models,
      this.cursor,
      this.timestamp})
      : code = codeCancelled;

  factory ResponseModel.fromJson(
    dynamic json, {
    bool Function(Json json)? modelFilter,
  }) {
    final dynamic data = json;
    final bool hasData = data != null;
    final bool isModels = data is List;
    final res = ResponseModel<T>(
      code: json['errCode'] ?? json['code'] ?? codeSucceed,
      msg: json['errMsg'] ?? json['msg'] ?? errorExternalRequest,
      data: hasData && !isModels ? makeModel<T>(data as Json) : null,
      // data: makeModel<T>(res1),
      timestamp: json['timestamp'] ?? json['timestamp'] ?? 0,
      rawData: data,
    );
    return res;
  }

  ResponseModel<Y> replaceTypeData<Y extends T>({
    Y? data,
    List<Y>? models,
    int? total,
  }) {
    return ResponseModel<Y>(
      code: code,
      msg: msg,
      data: data,
      rawData: rawData,
      page: page,
      total: total,
      canLoadMore: canLoadMore,
      cursor: cursor,
      timestamp: timestamp,
    );
  }

  static const int codeSucceed = 200;
  static const int codeFailed = 1;
  static const int codeCancelled = -1;
  static const String errorInternalRequest = '_InternalRequestError';
  static const String errorExternalRequest = '_ExternalError';

  final int code;
  final String msg;
  final T? data;

  /// This is the raw data for the model.
  final dynamic rawData;
  final int? timestamp;

  /// Below fields only works when requesting a list of data.
  final int? page;
  final int? total;
  final bool canLoadMore;
  final List<T>? models;

  /// Tracking visit position.
  final String? cursor;

  bool get isSucceed => code == 200 || code == 0;

  bool get isFailed => code == codeFailed;

  bool get isCancelled => code == codeCancelled;

  ResponseModel<T> copyWith(
      {int? code,
      String? msg,
      String? rawData,
      T? data,
      int? page,
      int? total,
      bool? canLoadMore,
      List<T>? models,
      String? cursor,
      int? timestamp}) {
    return ResponseModel<T>(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        data: data ?? this.data,
        rawData: data ?? this.rawData,
        page: page ?? this.page,
        total: total ?? this.total,
        canLoadMore: canLoadMore ?? this.canLoadMore,
        models: models ?? this.models,
        cursor: cursor ?? this.cursor,
        timestamp: timestamp ?? this.timestamp);
  }

  Json toJson() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'data': (data ?? rawData),
      'timestamp': timestamp ?? 0,
      if (page != null) 'cursor': total,
      if (total != null) 'count': total,
      if (canLoadMore) 'has_more': true,
      if (cursor != null) 'cursor': cursor,
    };
  }

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert(toJson());
}
