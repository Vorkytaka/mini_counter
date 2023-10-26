import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'common.dart';
import 'platform_provider.dart';

Future<T?> showPlatformBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  final platform = PlatformProvider.of(context);

  if (platform.isCupertino) {
    return CupertinoScaffold.showCupertinoModalBottomSheet<T>(
      context: context,
      builder: builder,
      expand: true,
    );
  } else {
    return showMaterialModalBottomSheet<T>(
      context: context,
      builder: builder,
      expand: true,
    );
  }
}
