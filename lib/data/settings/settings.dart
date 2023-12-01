import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Setting<T> extends ValueNotifier<T?> {
  Setting(T? value) : super(value);

  String get key;

  Future<void> set(T? value);
}

abstract class SharedSetting<T> extends Setting<T> {
  final SharedPreferences sharedPreferences;

  @override
  final String key;

  SharedSetting({
    required this.sharedPreferences,
    required this.key,
    T? initialValue,
  }) : super(initialValue);
}

class BoolSharedSetting extends SharedSetting<bool> {
  BoolSharedSetting({
    required super.sharedPreferences,
    required super.key,
    bool? initialValue,
  }) : super(initialValue: initialValue);

  @override
  bool? get value => sharedPreferences.getBool(key);

  @override
  Future<void> set(bool? value) async {
    if (value == null) {
      await sharedPreferences.remove(key);
    } else {
      await sharedPreferences.setBool(key, value);
    }

    this.value = value;
  }
}
