import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static const Duration receiveTimeout = Duration(seconds: 30);

  static String baseDomain = dotenv.env['API_URL'] ?? "";
  static const String socketURL = "http://192.168.1.136:3002";
  static String baseAPIURL = dotenv.env['API_BASE_URL'] ?? "";

  // Endpoints
  static const String initialURL = "/";

  // Auth
  static String loginURL = "/users/login";
  static String registerURL = "/users/register";

  // Profile
  static String profileURL = "/users/me";

  // Children
  static String childrenURL = "/users/child";

  // Articles
  static String articlesURL = "/articles";

  // Appointments
  static String appointmentsURL = "/appointments";
}
