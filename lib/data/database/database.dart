import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'converter.dart';

part 'database.g.dart';

@DriftDatabase(include: {'tables.drift'})
class Database extends _$Database {
  Database() : super(_connection);

  @override
  int get schemaVersion => 1;

  static QueryExecutor get _connection => LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(join(dbFolder.path, 'db.sqlite'));
        return NativeDatabase.createInBackground(file, logStatements: true);
      });
}
