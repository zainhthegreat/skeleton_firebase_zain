
import 'package:dio/dio.dart';

import '../service/logger.dart';

///This child of INtercepetor procided by dio would automatically display dio errors, response and requests
///
///
class NetworkInterceptor extends Interceptor {
  final _logger = getLogger(prefix: 'NetworkInterceptor');
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('******************[API request]*********************');
    _logger.d(
        '--> ${options.method.toUpperCase()} METHOD ${options.baseUrl}${options.path}}');
    _logger.d("Headers:");
    options.headers.forEach((k, v) => _logger.d('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      _logger.d("queryParameters:");
      options.queryParameters.forEach((k, v) => _logger.d('$k: $v'));
    }
    if (options.data != null) {
      _logger.d("Body: ${options.data}");
    }
    _logger.d('--> END ${options.method.toUpperCase()}');

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logger.d('******************[API ERROR]*********************');

    if (err.response != null) {
      _logger.e('ERROR RESPONSE -  ${err.response.toString()}');
    } else {
      _logger.e('ERROR - ${err.error.toString()}');
    }
    //Additional console logging for non prod users
    // if (!FlavorConfig.isPROD()) {
    //   log(
    //     'API ERROR',
    //     name: 'API ERROR - PRINTING ERROR RESPONSE',
    //     error: err,
    //     stackTrace: err.stackTrace,
    //     time: DateTime.now(),
    //   );
    // }

    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d('>>>>>>>>>>>>>>>>>[API Response]<<<<<<<<<<<<<<<<<<<');
    _logger.d('<-- ${response.statusCode} ${response.statusMessage}');
    _logger.d('<-- ${response.data}');
    _logger.d("Headers:");
    response.headers.forEach((k, v) => _logger.d('$k: $v'));
    _logger.d("Response: ${response.data}");
    _logger.d("<-- END HTTP");
    handler.next(response);
  }
}
