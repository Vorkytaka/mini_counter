import 'dart:convert';

import 'package:drift/drift.dart';

class UUIDConverter extends TypeConverter<String, Uint8List> {
  const UUIDConverter();

  static TypeConverter<String?, Uint8List?> get nullable =>
      const NullAwareTypeConverter.wrap(UUIDConverter());

  @override
  String fromSql(Uint8List fromDb) => base64UrlEncode(fromDb);

  @override
  Uint8List toSql(String value) => base64Decode(value);
}

/// Converter for [DateTime] that store value as an UTC unix timestamp.
class UTCDateTimeConverter implements TypeConverter<DateTime, int> {
  const UTCDateTimeConverter();

  /// Static method that wrap this converter with nullable value.
  static TypeConverter<DateTime?, int?> get nullable =>
      const NullAwareTypeConverter.wrap(UTCDateTimeConverter());

  @override
  DateTime fromSql(int fromDb) {
    final asUts =
        DateTime.fromMillisecondsSinceEpoch(fromDb * 1000, isUtc: true);
    return asUts.toLocal();
  }

  @override
  int toSql(DateTime value) {
    final utc = value.toUtc();
    return utc.millisecondsSinceEpoch ~/ 1000;
  }
}
