import 'package:drift/drift.dart';

import 'database/database.dart';

class Repository {
  final Database database;

  const Repository({
    required this.database,
  });

  Future<int> createCounter(
    String? title,
    bool negative,
    int step,
  ) =>
      database.createCounter(
        title,
        negative,
        step,
      );

  Stream<List<String>> get getCountersIds {
    final query = database.select(database.counters);
    return query.map((p0) => p0.id).watch();
  }

  Stream<Counter> counter(String id) {
    final query = database.select(database.counters);

    query.where((tbl) => tbl.id.equalsValue(id));
    return query.watchSingle();
  }

  Future<void> increment(String counterId) async {
    final query = database.update(database.counters);
    query.where((tbl) => tbl.id.equalsValue(counterId));
    await query.write(CountersCompanion.custom(
      value: const CustomExpression('value + step'),
    ));
  }

  Future<void> decrement(String counterId) async {
    final query = database.update(database.counters);
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
    final query = database.delete(database.counters);
    query.where((tbl) => tbl.id.equalsValue(counterId));
    await query.go();
  }

  Future<void> updateCounter(
    String id, {
    String? title,
    bool? negative,
    int? step,
  }) async {
    final query = database.update(database.counters);
    query.where((tbl) => tbl.id.equalsValue(id));
    await query.write(CountersCompanion(
      title: Value(title),
      negative: negative != null ? Value(negative) : const Value.absent(),
      step: step != null ? Value(step) : const Value.absent(),
    ));
  }

  Future<void> resetCounter(String id) async {
    final query = database.update(database.counters);
    query.where((tbl) => tbl.id.equalsValue(id));
    await query.write(const CountersCompanion(value: Value(0)));
  }

  Future<List<CountersUpdate>> getUpdates() {
    final query = database.select(database.countersUpdates);
    return query.get();
  }
}
