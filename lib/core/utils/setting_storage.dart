import 'dart:convert';
import 'dart:developer';

import 'package:secure_storage/secure_storage.dart';

import '../common/models/setting_model.dart';

class SettingStorage {
  final SecureStorage _secureStorage;
  static String hasOpenedKey = "has_opened";
  SettingStorage({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  Future<void> setToken(SettingModel setting) async {
    try {
      await _secureStorage.write(key: hasOpenedKey, value: jsonEncode(setting));
    } on Exception catch (error) {
      log("$error", name: "Set Token");
    }
  }

  Future<void> clearSettings() async {
    try {
      await _secureStorage.delete(key: hasOpenedKey);
    } on Exception catch (error) {
      log("$error", name: "Clear Settings");
    }
  }

  Future<bool> get hasOpened async {
    try {
      // Read the setting JSON string from secure storage
      final String? tokenJson = await _secureStorage.read(key: hasOpenedKey);

      // Check if the setting JSON string is not null or empty
      if (tokenJson != null && tokenJson.isNotEmpty) {
        // Parse the JSON string and extract the access setting
        return SettingModel.fromJson(jsonDecode(tokenJson)).hasOpened ?? false;
      }
    } catch (e) {
      // Handle potential exceptions, such as JSON decoding errors
      log('Error reading or parsing setting: $e');
    }

    // Return null if the setting was not found or an error occurred
    return false;
  }

  Future<void> clear() async {
    await _secureStorage.clear();
  }
}
