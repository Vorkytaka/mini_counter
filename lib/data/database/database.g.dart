// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Counters extends Table with TableInfo<Counters, Counter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Counters(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumnWithTypeConverter<String, Uint8List> id =
      GeneratedColumn<Uint8List>('id', aliasedName, false,
              type: DriftSqlType.blob,
              requiredDuringInsert: false,
              $customConstraints:
                  'NOT NULL PRIMARY KEY DEFAULT (randomblob(16))',
              defaultValue: const CustomExpression('randomblob(16)'))
          .withConverter<String>(Counters.$converterid);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _tableOrderMeta =
      const VerificationMeta('tableOrder');
  late final GeneratedColumn<int> tableOrder = GeneratedColumn<int>(
      'table_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _negativeMeta =
      const VerificationMeta('negative');
  late final GeneratedColumn<bool> negative = GeneratedColumn<bool>(
      'negative', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _stepMeta = const VerificationMeta('step');
  late final GeneratedColumn<int> step = GeneratedColumn<int>(
      'step', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  static const VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedDate =
      GeneratedColumn<int>('updated_date', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              $customConstraints:
                  'NOT NULL DEFAULT (strftime(\'%s\', CURRENT_TIMESTAMP))',
              defaultValue:
                  const CustomExpression('strftime(\'%s\', CURRENT_TIMESTAMP)'))
          .withConverter<DateTime>(Counters.$converterupdatedDate);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  late final GeneratedColumnWithTypeConverter<DateTime, int> createdDate =
      GeneratedColumn<int>('created_date', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              $customConstraints:
                  'NOT NULL DEFAULT (strftime(\'%s\', CURRENT_TIMESTAMP))',
              defaultValue:
                  const CustomExpression('strftime(\'%s\', CURRENT_TIMESTAMP)'))
          .withConverter<DateTime>(Counters.$convertercreatedDate);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, value, tableOrder, negative, step, updatedDate, createdDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'counters';
  @override
  VerificationContext validateIntegrity(Insertable<Counter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_idMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('table_order')) {
      context.handle(
          _tableOrderMeta,
          tableOrder.isAcceptableOrUnknown(
              data['table_order']!, _tableOrderMeta));
    } else if (isInserting) {
      context.missing(_tableOrderMeta);
    }
    if (data.containsKey('negative')) {
      context.handle(_negativeMeta,
          negative.isAcceptableOrUnknown(data['negative']!, _negativeMeta));
    }
    if (data.containsKey('step')) {
      context.handle(
          _stepMeta, step.isAcceptableOrUnknown(data['step']!, _stepMeta));
    }
    context.handle(_updatedDateMeta, const VerificationResult.success());
    context.handle(_createdDateMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Counter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Counter(
      id: Counters.$converterid.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}id'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
      tableOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}table_order'])!,
      negative: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}negative'])!,
      step: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}step'])!,
      updatedDate: Counters.$converterupdatedDate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_date'])!),
      createdDate: Counters.$convertercreatedDate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_date'])!),
    );
  }

  @override
  Counters createAlias(String alias) {
    return Counters(attachedDatabase, alias);
  }

  static TypeConverter<String, Uint8List> $converterid = const UUIDConverter();
  static TypeConverter<DateTime, int> $converterupdatedDate =
      const UTCDateTimeConverter();
  static TypeConverter<DateTime, int> $convertercreatedDate =
      const UTCDateTimeConverter();
  @override
  bool get dontWriteConstraints => true;
}

class Counter extends DataClass implements Insertable<Counter> {
  final String id;
  final String? title;
  final int value;
  final int tableOrder;
  final bool negative;
  final int step;
  final DateTime updatedDate;
  final DateTime createdDate;
  const Counter(
      {required this.id,
      this.title,
      required this.value,
      required this.tableOrder,
      required this.negative,
      required this.step,
      required this.updatedDate,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      final converter = Counters.$converterid;
      map['id'] = Variable<Uint8List>(converter.toSql(id));
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['value'] = Variable<int>(value);
    map['table_order'] = Variable<int>(tableOrder);
    map['negative'] = Variable<bool>(negative);
    map['step'] = Variable<int>(step);
    {
      final converter = Counters.$converterupdatedDate;
      map['updated_date'] = Variable<int>(converter.toSql(updatedDate));
    }
    {
      final converter = Counters.$convertercreatedDate;
      map['created_date'] = Variable<int>(converter.toSql(createdDate));
    }
    return map;
  }

  CountersCompanion toCompanion(bool nullToAbsent) {
    return CountersCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      value: Value(value),
      tableOrder: Value(tableOrder),
      negative: Value(negative),
      step: Value(step),
      updatedDate: Value(updatedDate),
      createdDate: Value(createdDate),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Counter(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      value: serializer.fromJson<int>(json['value']),
      tableOrder: serializer.fromJson<int>(json['table_order']),
      negative: serializer.fromJson<bool>(json['negative']),
      step: serializer.fromJson<int>(json['step']),
      updatedDate: serializer.fromJson<DateTime>(json['updated_date']),
      createdDate: serializer.fromJson<DateTime>(json['created_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String?>(title),
      'value': serializer.toJson<int>(value),
      'table_order': serializer.toJson<int>(tableOrder),
      'negative': serializer.toJson<bool>(negative),
      'step': serializer.toJson<int>(step),
      'updated_date': serializer.toJson<DateTime>(updatedDate),
      'created_date': serializer.toJson<DateTime>(createdDate),
    };
  }

  Counter copyWith(
          {String? id,
          Value<String?> title = const Value.absent(),
          int? value,
          int? tableOrder,
          bool? negative,
          int? step,
          DateTime? updatedDate,
          DateTime? createdDate}) =>
      Counter(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        value: value ?? this.value,
        tableOrder: tableOrder ?? this.tableOrder,
        negative: negative ?? this.negative,
        step: step ?? this.step,
        updatedDate: updatedDate ?? this.updatedDate,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Counter(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('tableOrder: $tableOrder, ')
          ..write('negative: $negative, ')
          ..write('step: $step, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, value, tableOrder, negative, step, updatedDate, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Counter &&
          other.id == this.id &&
          other.title == this.title &&
          other.value == this.value &&
          other.tableOrder == this.tableOrder &&
          other.negative == this.negative &&
          other.step == this.step &&
          other.updatedDate == this.updatedDate &&
          other.createdDate == this.createdDate);
}

class CountersCompanion extends UpdateCompanion<Counter> {
  final Value<String> id;
  final Value<String?> title;
  final Value<int> value;
  final Value<int> tableOrder;
  final Value<bool> negative;
  final Value<int> step;
  final Value<DateTime> updatedDate;
  final Value<DateTime> createdDate;
  final Value<int> rowid;
  const CountersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.value = const Value.absent(),
    this.tableOrder = const Value.absent(),
    this.negative = const Value.absent(),
    this.step = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountersCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.value = const Value.absent(),
    required int tableOrder,
    this.negative = const Value.absent(),
    this.step = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tableOrder = Value(tableOrder);
  static Insertable<Counter> custom({
    Expression<Uint8List>? id,
    Expression<String>? title,
    Expression<int>? value,
    Expression<int>? tableOrder,
    Expression<bool>? negative,
    Expression<int>? step,
    Expression<int>? updatedDate,
    Expression<int>? createdDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (value != null) 'value': value,
      if (tableOrder != null) 'table_order': tableOrder,
      if (negative != null) 'negative': negative,
      if (step != null) 'step': step,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (createdDate != null) 'created_date': createdDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? title,
      Value<int>? value,
      Value<int>? tableOrder,
      Value<bool>? negative,
      Value<int>? step,
      Value<DateTime>? updatedDate,
      Value<DateTime>? createdDate,
      Value<int>? rowid}) {
    return CountersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      tableOrder: tableOrder ?? this.tableOrder,
      negative: negative ?? this.negative,
      step: step ?? this.step,
      updatedDate: updatedDate ?? this.updatedDate,
      createdDate: createdDate ?? this.createdDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      final converter = Counters.$converterid;

      map['id'] = Variable<Uint8List>(converter.toSql(id.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (tableOrder.present) {
      map['table_order'] = Variable<int>(tableOrder.value);
    }
    if (negative.present) {
      map['negative'] = Variable<bool>(negative.value);
    }
    if (step.present) {
      map['step'] = Variable<int>(step.value);
    }
    if (updatedDate.present) {
      final converter = Counters.$converterupdatedDate;

      map['updated_date'] = Variable<int>(converter.toSql(updatedDate.value));
    }
    if (createdDate.present) {
      final converter = Counters.$convertercreatedDate;

      map['created_date'] = Variable<int>(converter.toSql(createdDate.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('tableOrder: $tableOrder, ')
          ..write('negative: $negative, ')
          ..write('step: $step, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CountersUpdates extends Table
    with TableInfo<CountersUpdates, CountersUpdate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CountersUpdates(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _counterIdMeta =
      const VerificationMeta('counterId');
  late final GeneratedColumn<Uint8List> counterId = GeneratedColumn<Uint8List>(
      'counter_id', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  late final GeneratedColumnWithTypeConverter<DateTime, int> datetime =
      GeneratedColumn<int>('datetime', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(CountersUpdates.$converterdatetime);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, counterId, datetime, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'counters_updates';
  @override
  VerificationContext validateIntegrity(Insertable<CountersUpdate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('counter_id')) {
      context.handle(_counterIdMeta,
          counterId.isAcceptableOrUnknown(data['counter_id']!, _counterIdMeta));
    } else if (isInserting) {
      context.missing(_counterIdMeta);
    }
    context.handle(_datetimeMeta, const VerificationResult.success());
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountersUpdate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountersUpdate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      counterId: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}counter_id'])!,
      datetime: CountersUpdates.$converterdatetime.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datetime'])!),
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
    );
  }

  @override
  CountersUpdates createAlias(String alias) {
    return CountersUpdates(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converterdatetime =
      const UTCDateTimeConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CountersUpdate extends DataClass implements Insertable<CountersUpdate> {
  final int id;
  final Uint8List counterId;
  final DateTime datetime;
  final int value;
  const CountersUpdate(
      {required this.id,
      required this.counterId,
      required this.datetime,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['counter_id'] = Variable<Uint8List>(counterId);
    {
      final converter = CountersUpdates.$converterdatetime;
      map['datetime'] = Variable<int>(converter.toSql(datetime));
    }
    map['value'] = Variable<int>(value);
    return map;
  }

  CountersUpdatesCompanion toCompanion(bool nullToAbsent) {
    return CountersUpdatesCompanion(
      id: Value(id),
      counterId: Value(counterId),
      datetime: Value(datetime),
      value: Value(value),
    );
  }

  factory CountersUpdate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountersUpdate(
      id: serializer.fromJson<int>(json['id']),
      counterId: serializer.fromJson<Uint8List>(json['counter_id']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'counter_id': serializer.toJson<Uint8List>(counterId),
      'datetime': serializer.toJson<DateTime>(datetime),
      'value': serializer.toJson<int>(value),
    };
  }

  CountersUpdate copyWith(
          {int? id, Uint8List? counterId, DateTime? datetime, int? value}) =>
      CountersUpdate(
        id: id ?? this.id,
        counterId: counterId ?? this.counterId,
        datetime: datetime ?? this.datetime,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('CountersUpdate(')
          ..write('id: $id, ')
          ..write('counterId: $counterId, ')
          ..write('datetime: $datetime, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, $driftBlobEquality.hash(counterId), datetime, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountersUpdate &&
          other.id == this.id &&
          $driftBlobEquality.equals(other.counterId, this.counterId) &&
          other.datetime == this.datetime &&
          other.value == this.value);
}

class CountersUpdatesCompanion extends UpdateCompanion<CountersUpdate> {
  final Value<int> id;
  final Value<Uint8List> counterId;
  final Value<DateTime> datetime;
  final Value<int> value;
  const CountersUpdatesCompanion({
    this.id = const Value.absent(),
    this.counterId = const Value.absent(),
    this.datetime = const Value.absent(),
    this.value = const Value.absent(),
  });
  CountersUpdatesCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List counterId,
    required DateTime datetime,
    required int value,
  })  : counterId = Value(counterId),
        datetime = Value(datetime),
        value = Value(value);
  static Insertable<CountersUpdate> custom({
    Expression<int>? id,
    Expression<Uint8List>? counterId,
    Expression<int>? datetime,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (counterId != null) 'counter_id': counterId,
      if (datetime != null) 'datetime': datetime,
      if (value != null) 'value': value,
    });
  }

  CountersUpdatesCompanion copyWith(
      {Value<int>? id,
      Value<Uint8List>? counterId,
      Value<DateTime>? datetime,
      Value<int>? value}) {
    return CountersUpdatesCompanion(
      id: id ?? this.id,
      counterId: counterId ?? this.counterId,
      datetime: datetime ?? this.datetime,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (counterId.present) {
      map['counter_id'] = Variable<Uint8List>(counterId.value);
    }
    if (datetime.present) {
      final converter = CountersUpdates.$converterdatetime;

      map['datetime'] = Variable<int>(converter.toSql(datetime.value));
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountersUpdatesCompanion(')
          ..write('id: $id, ')
          ..write('counterId: $counterId, ')
          ..write('datetime: $datetime, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final Counters counters = Counters(this);
  late final CountersUpdates countersUpdates = CountersUpdates(this);
  late final Trigger counterUpdateTimestamp = Trigger(
      'CREATE TRIGGER IF NOT EXISTS counter_update_timestamp AFTER UPDATE ON counters BEGIN UPDATE counters SET updated_date = strftime(\'%s\', CURRENT_TIMESTAMP) WHERE id = old.id;END',
      'counter_update_timestamp');
  late final Trigger countersUpdatesTrigger = Trigger(
      'CREATE TRIGGER IF NOT EXISTS counters_updates_trigger AFTER UPDATE OF value ON counters BEGIN INSERT INTO counters_updates (counter_id, datetime, value) VALUES (OLD.id,(strftime(\'%s\', CURRENT_TIMESTAMP)), NEW.value - OLD.value);END',
      'counters_updates_trigger');
  late final Trigger countersUpdatesCleanTrigger = Trigger(
      'CREATE TRIGGER IF NOT EXISTS counters_updates_clean_trigger AFTER DELETE ON counters BEGIN DELETE FROM counters_updates WHERE counter_id = OLD.id;END',
      'counters_updates_clean_trigger');
  Future<int> createCounter(String? title, bool negative, int step) {
    return customInsert(
      'INSERT INTO counters (title, table_order, negative, step) VALUES (?1, IFNULL((SELECT MAX(table_order) FROM counters), 0) + 100, ?2, ?3)',
      variables: [
        Variable<String>(title),
        Variable<bool>(negative),
        Variable<int>(step)
      ],
      updates: {counters},
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        counters,
        countersUpdates,
        counterUpdateTimestamp,
        countersUpdatesTrigger,
        countersUpdatesCleanTrigger
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('counters',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('counters', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('counters',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('counters_updates', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('counters',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('counters_updates', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
