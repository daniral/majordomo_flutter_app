import 'package:flutter/foundation.dart';

void dprint(String message) {
  if (kDebugMode) {
    print("${DateTime.now().toString()} $message");
  }
}