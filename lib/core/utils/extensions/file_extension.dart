import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

extension FileExtension on File {}

extension MultipartFileExtension on Map<String, dynamic> {
  Map<String, MultipartFile> toMultipartStringMap() {
    return entries
        .where((entry) => entry.value != null)
        .map(
          (entry) => MapEntry(
            entry.key,
            MultipartFile.fromString(
              entry.value!,
              filename: entry.value.toString().getFileName(),
            ),
          ),
        )
        .toMap();
  }

  Future<Map<String, MultipartFile>> toMultipart() async {
    final Map<String, MultipartFile> mapData = {};
    final noNullEntries = entries.where((entry) => entry.value != null);
    for (final entry in noNullEntries) {
      mapData[entry.key] = await MultipartFile.fromFile(entry.value);
    }

    return mapData;
  }
}

extension on Iterable<MapEntry<String, MultipartFile>> {
  Map<String, MultipartFile> toMap() {
    final map = <String, MultipartFile>{};
    for (final entry in this) {
      map[entry.key] = entry.value;
    }
    return map;
  }
}

extension FileNameExtension on String {
  String getFileName() => basename(this);
}
