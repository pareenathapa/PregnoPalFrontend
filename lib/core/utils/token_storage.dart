import 'dart:convert';
import 'dart:developer';

import 'package:secure_storage/secure_storage.dart';

import '../common/models/token_model.dart';

class TokenStorage {
  final SecureStorage _secureStorage;
  static String tokenKey = "token";
  TokenStorage({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  Future<void> setToken(TokenModel token) async {
    try {
      await _secureStorage.write(key: tokenKey, value: jsonEncode(token));
    } on Exception catch (error) {
      log("$error", name: "Set Token");
    }
  }

  Future<void> clearToken() async {
    try {
      await _secureStorage.delete(key: tokenKey);
    } on Exception catch (error) {
      log("$error", name: "Clear Token");
    }
  }

  Future<String?> get accessToken async {
    try {
      // Read the token JSON string from secure storage
      final String? tokenJson = await _secureStorage.read(key: tokenKey);

      // Check if the token JSON string is not null or empty
      if (tokenJson != null && tokenJson.isNotEmpty) {
        // Parse the JSON string and extract the access token
        return TokenModel.fromJson(jsonDecode(tokenJson)).accessToken;
      }
    } catch (e) {
      // Handle potential exceptions, such as JSON decoding errors
      log('Error reading or parsing token: $e');
    }

    // Return null if the token was not found or an error occurred
    return null;
  }

  Future<String?> get refreshToken async {
    try {
      // Read the token JSON string from secure storage
      final String? tokenJson = await _secureStorage.read(key: tokenKey);

      // Check if the token JSON string is not null or empty
      if (tokenJson != null && tokenJson.isNotEmpty) {
        // Parse the JSON string and extract the refresh token
        return TokenModel.fromJson(jsonDecode(tokenJson)).refreshToken;
      }
    } catch (e) {
      // Handle potential exceptions, such as JSON decoding errors
      log('Error reading or parsing token: $e');
    }

    // Return null if the token was not found or an error occurred
    return null;
  }

  Future<String?> get deviceToken async {
    try {
      // Read the token JSON string from secure storage
      final String? tokenJson = await _secureStorage.read(key: tokenKey);

      // Check if the token JSON string is not null or empty
      if (tokenJson != null && tokenJson.isNotEmpty) {
        // Parse the JSON string and extract the device token
        return TokenModel.fromJson(jsonDecode(tokenJson)).deviceToken;
      }
    } catch (e) {
      // Handle potential exceptions, such as JSON decoding errors
      log('Error reading or parsing token: $e');
    }

    // Return null if the token was not found or an error occurred
    return null;
  }

  Future<void> clear() async {
    await _secureStorage.clear();
  }
}
