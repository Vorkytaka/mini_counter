import 'package:flutter/material.dart';

import 'dependency.dart';
import 'presentation/app.dart';

void main() {
  final dependencies = DependenciesImpl();

  runApp(App(dependencies: dependencies));
}
