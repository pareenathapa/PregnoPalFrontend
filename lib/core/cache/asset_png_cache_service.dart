import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'contract/base_cache_service.dart';

class AssetPngCacheService extends BaseCacheService<Uint8List> {
  @override
  bool get shouldCache => !kDebugMode;

  @override
  Future<Uint8List?> convert(String key) async {
    try {
      return (await rootBundle.load(key)).buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }
}
