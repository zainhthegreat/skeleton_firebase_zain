import 'package:dio/dio.dart';

///This is the [BaseDio] through which all the Http-API calls would go through.
///We would be registering a singleton and use it across the app.
abstract class BaseDio {
  final Dio _dio;
  BaseDio(this._dio);

  Future<T?> httpGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? body,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    if (T == Response) {
      final Response response = await _dio.get(
        url,
        data: body,
        queryParameters: queryParameters,
        options: options ?? Options(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response as T;
    }
    final Response<T> response = await _dio.get(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response as T;
  }

  Future<T?> httpPost<T>(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    if (T == Response) {
      final Response response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: options ?? Options(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response as T;
    }
    final Response<T> response = await _dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    return response as T;
  }

  Future<T?> httpPut<T>(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final Response<T> response = await _dio.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    return response.data;
  }

  Future<T?> httpPatch<T>(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final Response<T> response = await _dio.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    return response.data;
  }

  Future<T?> httpDelete<T>(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final Response<T> response = await _dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(),
      cancelToken: cancelToken,
    );
    return response.data;
  }
//
//EOF
}
