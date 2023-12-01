import 'package:shared_preferences/shared_preferences.dart';

import 'data/database/database.dart';
import 'data/repository.dart';
import 'data/settings/settings.dart';

abstract class Dependencies {
  Database get database;

  Repository get repository;

  SharedPreferences get sharedPreferences;

  Setting<bool> get compactModeSetting;
}

class DependenciesImpl implements Dependencies {
  DependenciesImpl({
    required this.sharedPreferences,
  });

  @override
  late final Database database = Database();

  @override
  late final Repository repository = Repository(database: database);

  @override
  final SharedPreferences sharedPreferences;

  @override
  late final Setting<bool> compactModeSetting = BoolSharedSetting(
    sharedPreferences: sharedPreferences,
    key: 'settings/compact',
  );
}
