// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common__cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
        "delete_confirm__confirm":
            MessageLookupByLibrary.simpleMessage("Видалити"),
        "delete_confirm__title":
            MessageLookupByLibrary.simpleMessage("Видалити лічильник?"),
        "main_page__title": MessageLookupByLibrary.simpleMessage("Лічильники"),
        "reset_confirm__confirm":
            MessageLookupByLibrary.simpleMessage("Скинути"),
        "reset_confirm__title":
            MessageLookupByLibrary.simpleMessage("Скинути лічильник?"),
        "settings_page__compact_ui":
            MessageLookupByLibrary.simpleMessage("Компатний режим"),
        "settings_page__title":
            MessageLookupByLibrary.simpleMessage("Налаштування"),
        "upsert_page__hint_delete":
            MessageLookupByLibrary.simpleMessage("Видалити лічильник"),
        "upsert_page__hint_negative":
            MessageLookupByLibrary.simpleMessage("Негативні числа"),
        "upsert_page__hint_reset":
            MessageLookupByLibrary.simpleMessage("Скидання лічильника"),
        "upsert_page__hint_step":
            MessageLookupByLibrary.simpleMessage("Крок лічильника"),
        "upsert_page__hint_title":
            MessageLookupByLibrary.simpleMessage("Назва"),
        "upsert_page__title__add":
            MessageLookupByLibrary.simpleMessage("Додати лічильник"),
        "upsert_page__title__change":
            MessageLookupByLibrary.simpleMessage("Змінити лічильник")
      };
}
