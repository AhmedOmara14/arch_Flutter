import 'package:dio/dio.dart';
import 'ApiEndpoints.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('OKHTTP: ─────── REQUEST ───────────────────────────────');
          print('OKHTTP: METHOD: ${options.method}');
          print('OKHTTP: URL: ${options.baseUrl}${options.path}');
          if (options.queryParameters.isNotEmpty) {
            print('OKHTTP: QUERY PARAMETERS: ${options.queryParameters}');
          }
          if (options.data != null) {
            print('OKHTTP: BODY: ${options.data}');
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('OKHTTP: ─────── RESPONSE ──────────────────────────────');
          print('OKHTTP: STATUS: ${response.statusCode}');
          print('OKHTTP: DATA: ${response.data}');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('OKHTTP: ─────── ERROR ─────────────────────────────────');
          print('OKHTTP: MESSAGE: ${e.message}');
          if (e.response != null) {
            print('OKHTTP: STATUS: ${e.response?.statusCode}');
            print('OKHTTP: HEADERS: ${e.response?.headers}');
            print('OKHTTP: DATA: ${e.response?.data}');
          }
          handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
