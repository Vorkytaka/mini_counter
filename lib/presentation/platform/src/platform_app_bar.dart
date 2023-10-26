import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformSliverAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;

  const PlatformSliverAppBar({
    this.leading,
    this.trailing,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoSliverNavigationBar(
        trailing: trailing,
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
          if (trailing != null) trailing!,
        ],
      );
    }
  }
}

class PlatformAppBar extends StatelessWidget {
  final Widget? trailing;
  final Widget? title;
  final Widget? leading;

  const PlatformAppBar({
    this.trailing,
    this.title,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        leading: leading,
        middle: title,
        trailing: trailing,
      );
    } else {
      return AppBar(
        title: title,
        leading: leading,
        actions: [
          if (trailing != null) trailing!,
        ],
      );
    }
  }
}
