import 'dart:developer';
import 'package:flutter/foundation.dart';

class Console {
  static void debugPrint({String? key, required Object? msg}) {
    if (key != null) {
      if (kDebugMode) {
        print('******* $key *******');
      }
    }
    if (kDebugMode) {
      print(msg.toString());
    }
  }

  static void debugLongPrint({String? key, required Object? msg}) {
    if (key != null) {
      if (kDebugMode) {
        print('******* $key *******');
      }
    }
    if (kDebugMode) {
      log(msg.toString());
    }
  }
}
