import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'platform_provider.dart';

class PlatformApp extends StatelessWidget {
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  //

  final CupertinoThemeData? cupertinoTheme;
  final ThemeData? materialTheme;

  const PlatformApp({
    this.initialRoute,
    this.onGenerateRoute,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.cupertinoTheme,
    this.materialTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return CupertinoApp(
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        theme: cupertinoTheme,
      );
    } else {
      return MaterialApp(
        themeMode: ThemeMode.dark,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        theme: materialTheme,
      );
    }
  }
}
