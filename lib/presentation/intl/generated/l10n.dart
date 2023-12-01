// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `miniCounter`
  String get app_name {
    return Intl.message(
      'miniCounter',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common__cancel {
    return Intl.message(
      'Cancel',
      name: 'common__cancel',
      desc: '',
      args: [],
    );
  }

  /// `Counters`
  String get main_page__title {
    return Intl.message(
      'Counters',
      name: 'main_page__title',
      desc: '',
      args: [],
    );
  }

  /// `Add counter`
  String get upsert_page__title__add {
    return Intl.message(
      'Add counter',
      name: 'upsert_page__title__add',
      desc: '',
      args: [],
    );
  }

  /// `Change counter`
  String get upsert_page__title__change {
    return Intl.message(
      'Change counter',
      name: 'upsert_page__title__change',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get upsert_page__hint_title {
    return Intl.message(
      'Title',
      name: 'upsert_page__hint_title',
      desc: '',
      args: [],
    );
  }

  /// `Counter step`
  String get upsert_page__hint_step {
    return Intl.message(
      'Counter step',
      name: 'upsert_page__hint_step',
      desc: '',
      args: [],
    );
  }

  /// `Negative numbers`
  String get upsert_page__hint_negative {
    return Intl.message(
      'Negative numbers',
      name: 'upsert_page__hint_negative',
      desc: '',
      args: [],
    );
  }

  /// `Reset counter`
  String get upsert_page__hint_reset {
    return Intl.message(
      'Reset counter',
      name: 'upsert_page__hint_reset',
      desc: '',
      args: [],
    );
  }

  /// `Delete counter`
  String get upsert_page__hint_delete {
    return Intl.message(
      'Delete counter',
      name: 'upsert_page__hint_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete counter?`
  String get delete_confirm__title {
    return Intl.message(
      'Delete counter?',
      name: 'delete_confirm__title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete_confirm__confirm {
    return Intl.message(
      'Delete',
      name: 'delete_confirm__confirm',
      desc: '',
      args: [],
    );
  }

  /// `Reset counter?`
  String get reset_confirm__title {
    return Intl.message(
      'Reset counter?',
      name: 'reset_confirm__title',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset_confirm__confirm {
    return Intl.message(
      'Reset',
      name: 'reset_confirm__confirm',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_page__title {
    return Intl.message(
      'Settings',
      name: 'settings_page__title',
      desc: '',
      args: [],
    );
  }

  /// `Compact Display Mode`
  String get settings_page__compact_ui {
    return Intl.message(
      'Compact Display Mode',
      name: 'settings_page__compact_ui',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
