import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppValueNotifier<T> extends ValueNotifier<T> {
  AppValueNotifier(super.value);
  // Function to update the value based on logic provided
  void updateValue(T Function() logic) {
    log('AppValueNotifier: updateValue $value');
    value = logic();
    notifyListeners();
  }
}
