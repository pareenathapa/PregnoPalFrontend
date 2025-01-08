import 'dart:async';

abstract class BaseCacheService<T> {
  bool shouldCache = true;
  final Map<String, T> resultLoaded = {};
  final Map<String, Future<T?>> resultLoading = {};

  Future<T?> get(String key) async {
    if (!shouldCache) return convert(key);
    final T? result = resultLoaded[key];
    if (result != null) return result;
    final Future<T?>? markerLoading = resultLoading[key];
    if (markerLoading != null) return markerLoading;
    resultLoading[key] = _convertAndSet(key);
    return resultLoading[key];
  }

  T? getSync(String url) => resultLoaded[url];

  Future<T?> convert(String key);

  Future<T?> _convertAndSet(String key) async {
    final result = await convert(key);
    if (result == null) return null;
    if (shouldCache) resultLoaded[key] = result;
    return result;
  }
}
