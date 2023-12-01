import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final dependencies = DependenciesImpl(
    sharedPreferences: sharedPreferences,
  );

  runApp(App(dependencies: dependencies));
}
