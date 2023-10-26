import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const PlatformIconButton({
    required this.icon,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        child: icon,
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        padding: padding,
        icon: icon,
      );
    }
  }
}
