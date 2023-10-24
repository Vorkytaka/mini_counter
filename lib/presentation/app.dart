import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../dependency.dart';
import 'intl/generated/l10n.dart';
import 'main_page.dart';

class App extends StatelessWidget {
  final Dependencies dependencies;

  const App({
    required this.dependencies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<Dependencies>.value(
      value: dependencies,
      updateShouldNotify: (prev, curr) => false,
      child: CupertinoApp(
        theme: const CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF171717),
          primaryColor: Color.fromARGB(255, 10, 132, 255),
          barBackgroundColor: Color(0xF01D1D1D),
        ),
        // theme: generateTheme(),
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final Widget? page;
          switch (settings.name) {
            case '/':
              page = const MainPage();
              break;
            default:
              page = null;
              break;
          }

          if (page == null) {
            return null;
          }

          return MaterialPageRoute(
            builder: (context) {
              return CupertinoScaffold(
                body: page!,
              );
            },
          );
        },
      ),
    );
  }
}

ThemeData generateTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    platform: TargetPlatform.iOS,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ));
