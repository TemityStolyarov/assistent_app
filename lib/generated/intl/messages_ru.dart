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

  static String m0(elements) =>
      "${Intl.plural(elements, zero: 'элементов', one: 'элемента', few: 'элементов', other: 'элементов')}";

  static String m1(tasks) =>
      "${Intl.plural(tasks, zero: 'задач', one: 'задача', few: 'задачи', other: 'задач')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_": MessageLookupByLibrary.simpleMessage("Settings Page"),
        "__": MessageLookupByLibrary.simpleMessage("Errors"),
        "and": MessageLookupByLibrary.simpleMessage("И еще"),
        "elements": m0,
        "error_on_loading_main_page": MessageLookupByLibrary.simpleMessage(
            "Произошла непредвиденная ошибка при загрузке главного экрана\n\nПожалуйста, обратитесь в поддержку"),
        "error_on_loading_settings_page": MessageLookupByLibrary.simpleMessage(
            "Произошла непредвиденная ошибка при загрузке экрана настроек\n\nПожалуйста, обратитесь в поддержку"),
        "for_today": MessageLookupByLibrary.simpleMessage("на сегодня"),
        "required_field": MessageLookupByLibrary.simpleMessage(
            "Это поле является обязательным"),
        "task_amount_showing_on_main_page": MessageLookupByLibrary.simpleMessage(
            "Количество задач, отображаемых на главном\nэкране приложения: до"),
        "tasks": m1
      };
}
