import 'data/database/database.dart';
import 'data/repository.dart';

abstract class Dependencies {
  Database get database;

  Repository get repository;
}

class DependenciesImpl implements Dependencies {
  @override
  late final Database database = Database();

  @override
  late final Repository repository = Repository(database: database);
}
