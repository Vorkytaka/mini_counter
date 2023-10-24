// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("miniCounter"),
        "delete_confirm__cancel":
            MessageLookupByLibrary.simpleMessage("Отменить"),
        "delete_confirm__delete":
            MessageLookupByLibrary.simpleMessage("Удалить"),
        "delete_confirm__title":
            MessageLookupByLibrary.simpleMessage("Удалить счетчик?"),
        "main_page__title": MessageLookupByLibrary.simpleMessage("Счетчики"),
        "upsert_page__hint_delete":
            MessageLookupByLibrary.simpleMessage("Удалить счетчик"),
        "upsert_page__hint_negative":
            MessageLookupByLibrary.simpleMessage("Отрицательные числа"),
        "upsert_page__hint_step":
            MessageLookupByLibrary.simpleMessage("Шаг счетчика"),
        "upsert_page__hint_title":
            MessageLookupByLibrary.simpleMessage(" Название"),
        "upsert_page__title__add":
            MessageLookupByLibrary.simpleMessage("Добавить счетчик"),
        "upsert_page__title__change":
            MessageLookupByLibrary.simpleMessage("Изменить счетчик")
      };
}
