import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const PlatformScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      final ObstructingPreferredSizeWidget? appBar;
      if (this.appBar is ObstructingPreferredSizeWidget) {
        appBar = this.appBar as ObstructingPreferredSizeWidget;
      } else {
        appBar = null;
      }

      return CupertinoPageScaffold(
        navigationBar: appBar,
        child: body,
      );
    } else {
      return Scaffold(
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
      );
    }
  }
}
