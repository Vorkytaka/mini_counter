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

  Stream<List<String>> get getCountersIds {
    final query = select(counters);
    return query.map((p0) => p0.id).watch();
  }

  Stream<Counter> counter(String id) {
    final query = select(counters);
    query.where((tbl) => tbl.id.equalsValue(id));
    return query.watchSingle();
  }

  Future<void> increment(String counterId) async {
    final query = update(counters);
    query.where((tbl) => tbl.id.equalsValue(counterId));
    await query.write(CountersCompanion.custom(
      value: const CustomExpression('value + step'),
    ));
  }

  Future<void> decrement(String counterId) async {
    final query = update(counters);
    query.where((tbl) => tbl.id.equalsValue(counterId));
    await query.write(CountersCompanion.custom(
      value: const FunctionCallExpression('IIF', [
        CustomExpression('negative > 0'),
        CustomExpression('value - step'),
        CustomExpression('max(0, value - step)')
      ]),
    ));
  }

  Future<void> deleteCounter(String counterId) async {
    final query = delete(counters);
    query.where((tbl) => tbl.id.equalsValue(counterId));
    await query.go();
  }

  Future<void> updateCounter(
    String id, {
    String? title,
    bool? negative,
    int? step,
  }) async {
    final query = update(counters);
    query.where((tbl) => tbl.id.equalsValue(id));
    await query.write(CountersCompanion(
      title: Value(title),
      negative: negative != null ? Value(negative) : const Value.absent(),
      step: step != null ? Value(step) : const Value.absent(),
    ));
  }

  static QueryExecutor get _connection => LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(join(dbFolder.path, 'db.sqlite'));
        return NativeDatabase.createInBackground(file);
      });
}
