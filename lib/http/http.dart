import 'dart:io';

import 'package:art_app/config/config.dart';
import 'package:art_app/extension/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nirikshak/nirikshak.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/log/log.utils.dart';

class MyDecorator {
  final String message;
  const MyDecorator(this.message);
}

class Test {
  @MyDecorator('Hello, world!')
  void myFunction() {
    
  }
}



class HttpUtil {
  const HttpUtil._();
  static const String _tag = '🌐 HttpUtil';
  static bool isLogging = true;
  static Nirikshak nirikshak = Nirikshak();
  static final Dio dio = Dio()
    ..options = dioBaseOptions
    ..interceptors.addAll(dioInterceptors);

  static BaseOptions get dioBaseOptions {
    return BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: 10000.milliseconds,
      sendTimeout: 10000.milliseconds,
      receiveTimeout: 10000.milliseconds,
      receiveDataWhenStatusError: true,
    );
  }

  static get dioInterceptors => [
        if (kDebugMode) 
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
          nirikshak.getDioInterceptor(),
          _interceptor
      ];

  static void _log(
    Object? message, {
    StackTrace? stackTrace,
    bool isError = false,
  }) {
    if (isLogging) {
      if (isError) {
        LogUtil.e(message, stackTrace: stackTrace, tag: _tag);
      } else {
        LogUtil.d(message, stackTrace: stackTrace, tag: _tag);
      }
    }
  }

  static QueuedInterceptorsWrapper get _interceptor {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        _log('Fetching(${options.method}) url: ${options.uri}');
        if (options.data != null) {
          _log('Raw request body: ${options.data}');
        }
        handler.next(options);
      },
      onResponse: (Response<dynamic> res, ResponseInterceptorHandler handler) {
        _log(
          'Got response from: ${res.requestOptions.uri} ${res.statusCode}',
        );
        _log('Raw response body: ${res.data['data']}');
        dynamic resolvedData = res.data;
        if (res.statusCode == HttpStatus.noContent) {
          // resolvedData = _successModel().toJson();
        } else {
          final dynamic data = res.data;
          if (data is String) {
            try {
              // If we do want a JSON all the time, DO try to decode the data.
              // resolvedData = jsonDecode(data) as Json?;
            } catch (e) {
              resolvedData = data;
            }
          } else {
            resolvedData = data;
          }
        }
        res.data = resolvedData;
        handler.resolve(res);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        if (e.type == DioExceptionType.cancel) {
          // e.message,
              // e.requestOptions.uri.toString(),
          Response response = Response(
            requestOptions: e.requestOptions,
            data: {'message': e.message, 'data': e.requestOptions.uri.toString()}
          );
          handler.resolve(response);
          return;
        }

        // if (e.type == DioErrorType.badResponse &&
        //     e.response?.statusCode == ErrCode.CODE_KICK_OUT) {
        //   
        // }

        if (kDebugMode) {
          _log(e, stackTrace: e.stackTrace, isError: true);
        }
        final bool isConnectionTimeout = e.type == DioExceptionType.connectionTimeout;
        final bool isStatusError = e.response != null &&
            e.response!.statusCode != null &&
            e.response!.statusCode! >= HttpStatus.internalServerError;
        if (!isConnectionTimeout && isStatusError) {
          _log(
            'Error when requesting ${e.requestOptions.uri}\n$e\n'
            'Raw response data: ${e.response?.data}',
            isError: true,
          );
        }
        if (e.response?.data is String) {
          e.response!.data = e.response!.data! as String;
        }
        Response response = Response(
          requestOptions: e.requestOptions,
          data: e.message,
        );
        response.data = e.message;
        handler.resolve(response);
      },
    );
  }
}
