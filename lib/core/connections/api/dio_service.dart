import "package:dio/dio.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";

import '../../../config/constants/api/api_endpoints_constants.dart';
import 'authentication_interceptor.dart';
import 'connectivity_interceptor.dart';
import 'dio_error_interceptor.dart';

/// A service class for handling API requests using the Dio package.
///
/// This class encapsulates the Dio client configuration and setup, making it
/// easy to manage and use across the application. It includes default settings
/// for the base URL, headers, timeouts, and logging. It also integrates a custom
/// error interceptor for Dio requests.
class DioService {
  final Dio _dio = Dio();

  /// Constructor for [DioService].
  ///
  /// Configures the Dio client with default settings, including base URL,
  /// headers, timeouts, and interceptors for logging and error handling.
  DioService() {
    _dio
      ..options.baseUrl = ApiEndpoints.baseAPIURL
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..options.connectTimeout = ApiEndpoints.receiveTimeout
      // Adding PrettyDioLogger for detailed logging of requests and responses.
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      )

      // Adding an authentication interceptor for adding the access token to requests.
      ..interceptors.add(
        const AuthenticationInterceptor(),
      )
      // Adding a custom error interceptor for enhanced error handling.
      ..interceptors.add(
        DioErrorInterceptor(),
      );
  }

  /// Provides access to the configured Dio client for sending requests.
  ///
  /// This getter allows access to the Dio instance for making API calls
  /// with all the predefined configurations and interceptors.
  Dio get dio => _dio;
}
