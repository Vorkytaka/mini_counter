import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformSliverAppBar extends StatelessWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;

  const PlatformSliverAppBar({
    this.leading,
    this.actions,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoSliverNavigationBar(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...?actions,
          ],
        ),
        largeTitle: title,
        leading: leading,
      );
    } else {
      return SliverAppBar(
        leading: leading,
        floating: true,
        snap: true,
        pinned: true,
        expandedHeight: 80,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: title,
        ),
        actions: [
          ...?actions,
        ],
      );
    }
  }
}

class PlatformAppBar extends StatelessWidget {
  final Widget? trailing;
  final Widget? title;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const PlatformAppBar({
    this.trailing,
    this.title,
    this.leading,
    this.automaticallyImplyLeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoNavigationBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        transitionBetweenRoutes: false,
        leading: leading,
        middle: title,
        trailing: trailing,
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
        leading: leading,
        actions: [
          if (trailing != null) trailing!,
        ],
      );
    }
  }
}
