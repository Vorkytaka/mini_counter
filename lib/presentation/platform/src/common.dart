import 'package:flutter/foundation.dart';

extension TargetPlatformUtils on TargetPlatform {
  bool get isCupertino =>
      this == TargetPlatform.iOS || this == TargetPlatform.macOS;
}
