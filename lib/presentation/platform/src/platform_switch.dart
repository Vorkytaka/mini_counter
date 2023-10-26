import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const PlatformSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      );
    } else {
      return Switch(
        value: value,
        onChanged: onChanged,
      );
    }
  }
}
