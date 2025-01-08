import 'package:dio/dio.dart';

class ConnectivityInterceptor extends Interceptor {
  const ConnectivityInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionError) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: Response(
            requestOptions: err.requestOptions,
            statusCode: 503, // Statuscode for internet connection
            statusMessage: "No internet connection",
            data: {
              "message": "No internet connection",
            },
          ),
        ),
      );
    }
    super.onError(err, handler);
  }
}
