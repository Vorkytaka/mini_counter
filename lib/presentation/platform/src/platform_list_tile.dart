import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformListTile extends StatelessWidget {
  final Widget title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const PlatformListTile({
    required this.title,
    this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoListTile(
        title: title,
        trailing: trailing,
        onTap: onTap,
      );
    } else {
      return ListTile(
        title: title,
        trailing: trailing,
        onTap: onTap,
      );
    }
  }
}

class PlatformListTileGroup extends StatelessWidget {
  final List<Widget> children;

  const PlatformListTileGroup({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoListSection.insetGrouped(
        backgroundColor: Colors.transparent,
        children: children,
      );
    } else {
      final theme = Theme.of(context);

      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          type: MaterialType.canvas,
          color: theme.colorScheme.secondaryContainer,
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: children,
          ),
        ),
      );
    }
  }
}
