// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common__cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "delete_confirm__confirm":
            MessageLookupByLibrary.simpleMessage("Borrar"),
        "delete_confirm__title":
            MessageLookupByLibrary.simpleMessage("¿Borrar contador?"),
        "main_page__title": MessageLookupByLibrary.simpleMessage("Counters"),
        "reset_confirm__confirm":
            MessageLookupByLibrary.simpleMessage("Reiniciar"),
        "reset_confirm__title":
            MessageLookupByLibrary.simpleMessage("¿Restablecer contador?"),
        "settings_page__compact_ui": MessageLookupByLibrary.simpleMessage(
            "Modo de visualización compacto"),
        "settings_page__title":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "upsert_page__hint_delete":
            MessageLookupByLibrary.simpleMessage("Borrar contador"),
        "upsert_page__hint_negative":
            MessageLookupByLibrary.simpleMessage("Números negativos"),
        "upsert_page__hint_reset":
            MessageLookupByLibrary.simpleMessage("Reiniciar contador"),
        "upsert_page__hint_step":
            MessageLookupByLibrary.simpleMessage("Paso de contador"),
        "upsert_page__hint_title":
            MessageLookupByLibrary.simpleMessage("Título"),
        "upsert_page__title__add":
            MessageLookupByLibrary.simpleMessage("Añadir contador"),
        "upsert_page__title__change":
            MessageLookupByLibrary.simpleMessage("Cambiar contador")
      };
}
