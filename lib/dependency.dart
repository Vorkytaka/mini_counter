import 'data/database/database.dart';

abstract class Dependencies {
  Database get database;
}

class DependenciesImpl implements Dependencies {
  @override
  late final Database database = Database();
}
