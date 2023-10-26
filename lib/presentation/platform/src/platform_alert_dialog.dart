import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

Future<T?> showPlatformDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool? barrierDismissible,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
}) {
  final platform = PlatformProvider.of(context);

  if (platform.isCupertino) {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? false,
      barrierLabel: barrierLabel,
      useRootNavigator: useRootNavigator,
      anchorPoint: anchorPoint,
      routeSettings: routeSettings,
    );
  } else {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }
}

class PlatformAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget> actions;

  const PlatformAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    }
  }
}

class PlatformDialogAction extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isDefaultAction;
  final TextStyle? textStyle;

  const PlatformDialogAction({
    this.onPressed,
    required this.child,
    this.isDefaultAction = false,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        textStyle: textStyle,
        child: child,
      );
    } else {
      Widget action = child;

      if (textStyle != null) {
        action = DefaultTextStyle(
          style: textStyle!,
          child: child,
        );
      }

      return TextButton(
        onPressed: onPressed,
        child: action,
      );
    }
  }
}
