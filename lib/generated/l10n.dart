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

  // skipped getter for the '' key

  /// `И еще`
  String get and {
    return Intl.message(
      'И еще',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `{tasks, plural, zero{задач} one{задача} few{задачи} other{задач}}`
  String tasks(num tasks) {
    return Intl.plural(
      tasks,
      zero: 'задач',
      one: 'задача',
      few: 'задачи',
      other: 'задач',
      name: 'tasks',
      desc: '',
      args: [tasks],
    );
  }

  /// `на сегодня`
  String get for_today {
    return Intl.message(
      'на сегодня',
      name: 'for_today',
      desc: '',
      args: [],
    );
  }

  /// `Settings Page`
  String get _ {
    return Intl.message(
      'Settings Page',
      name: '_',
      desc: '',
      args: [],
    );
  }

  /// `Количество задач, отображаемых на главном\nэкране приложения: до`
  String get task_amount_showing_on_main_page {
    return Intl.message(
      'Количество задач, отображаемых на главном\nэкране приложения: до',
      name: 'task_amount_showing_on_main_page',
      desc: '',
      args: [],
    );
  }

  /// `{elements, plural, zero{элементов} one{элемента} few{элементов} other{элементов}}`
  String elements(num elements) {
    return Intl.plural(
      elements,
      zero: 'элементов',
      one: 'элемента',
      few: 'элементов',
      other: 'элементов',
      name: 'elements',
      desc: '',
      args: [elements],
    );
  }

  /// `Errors`
  String get __ {
    return Intl.message(
      'Errors',
      name: '__',
      desc: '',
      args: [],
    );
  }

  /// `Произошла непредвиденная ошибка при загрузке главного экрана\n\nПожалуйста, обратитесь в поддержку`
  String get error_on_loading_main_page {
    return Intl.message(
      'Произошла непредвиденная ошибка при загрузке главного экрана\n\nПожалуйста, обратитесь в поддержку',
      name: 'error_on_loading_main_page',
      desc: '',
      args: [],
    );
  }

  /// `Произошла непредвиденная ошибка при загрузке экрана настроек\n\nПожалуйста, обратитесь в поддержку`
  String get error_on_loading_settings_page {
    return Intl.message(
      'Произошла непредвиденная ошибка при загрузке экрана настроек\n\nПожалуйста, обратитесь в поддержку',
      name: 'error_on_loading_settings_page',
      desc: '',
      args: [],
    );
  }

  /// `Это поле является обязательным`
  String get required_field {
    return Intl.message(
      'Это поле является обязательным',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
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
