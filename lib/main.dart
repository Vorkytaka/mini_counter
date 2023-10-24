import 'package:flutter/material.dart';
import 'package:mini_counter/presentation/app.dart';

import 'dependency.dart';

void main() {
  final dependencies = DependenciesImpl();

  runApp(App(dependencies: dependencies));
}
