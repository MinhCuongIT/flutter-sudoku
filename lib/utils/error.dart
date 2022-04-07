import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///If error on release mode app will crash
void errorHandler() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      SystemNavigator.pop();
    }
  };
}
