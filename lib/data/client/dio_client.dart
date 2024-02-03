import 'package:dio/dio.dart';
import 'package:drone/config/env.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: URL.baseUrl,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      responseType: ResponseType.json,
      contentType: 'application/json',
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          options.headers['accept'] = 'application/json';
          return handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
        ),
      );
    }
  }

  final Dio _dio = Dio();

  Dio get sendRequest => _dio;
}
