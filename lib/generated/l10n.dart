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

  /// `Сегодня,`
  String get today {
    return Intl.message(
      'Сегодня,',
      name: 'today',
      desc: '',
      args: [],
    );
  }

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

  /// `Добавить задачу`
  String get addTaskButton {
    return Intl.message(
      'Добавить задачу',
      name: 'addTaskButton',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get addButton {
    return Intl.message(
      'Добавить',
      name: 'addButton',
      desc: '',
      args: [],
    );
  }

  /// `Отредактировать`
  String get editButton {
    return Intl.message(
      'Отредактировать',
      name: 'editButton',
      desc: '',
      args: [],
    );
  }

  /// `Вы точно хотите удалить задачу`
  String get confirmDeletion {
    return Intl.message(
      'Вы точно хотите удалить задачу',
      name: 'confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get deleteButton {
    return Intl.message(
      'Удалить',
      name: 'deleteButton',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить`
  String get confirmButtion {
    return Intl.message(
      'Подтвердить',
      name: 'confirmButtion',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get nameField {
    return Intl.message(
      'Название',
      name: 'nameField',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get noteField {
    return Intl.message(
      'Описание',
      name: 'noteField',
      desc: '',
      args: [],
    );
  }

  /// `Срок выполнения`
  String get dateField {
    return Intl.message(
      'Срок выполнения',
      name: 'dateField',
      desc: '',
      args: [],
    );
  }

  /// `Важная задача`
  String get importantField {
    return Intl.message(
      'Важная задача',
      name: 'importantField',
      desc: '',
      args: [],
    );
  }

  /// `На сегодня задач нет`
  String get noTasks {
    return Intl.message(
      'На сегодня задач нет',
      name: 'noTasks',
      desc: '',
      args: [],
    );
  }

  /// `Задачи на сегодня спрятаны :)`
  String get hiddenTasks {
    return Intl.message(
      'Задачи на сегодня спрятаны :)',
      name: 'hiddenTasks',
      desc: '',
      args: [],
    );
  }

  /// `Коснитесь для просмотра списка всех задач`
  String get showMore {
    return Intl.message(
      'Коснитесь для просмотра списка всех задач',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Коснитесь для просмотра задач на другие дни`
  String get showMoreOtherDays {
    return Intl.message(
      'Коснитесь для просмотра задач на другие дни',
      name: 'showMoreOtherDays',
      desc: '',
      args: [],
    );
  }

  /// `УФ`
  String get uv {
    return Intl.message(
      'УФ',
      name: 'uv',
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

  /// `Параметры`
  String get parameters {
    return Intl.message(
      'Параметры',
      name: 'parameters',
      desc: '',
      args: [],
    );
  }

  /// `Значение параметра`
  String get parameterValue {
    return Intl.message(
      'Значение параметра',
      name: 'parameterValue',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Советы`
  String get advices {
    return Intl.message(
      'Советы',
      name: 'advices',
      desc: '',
      args: [],
    );
  }

  /// `• Удалить задачу - двойное нажатие;`
  String get ad1 {
    return Intl.message(
      '• Удалить задачу - двойное нажатие;',
      name: 'ad1',
      desc: '',
      args: [],
    );
  }

  /// `• Редактировать задачу - нажатие на середину строки с задачей;`
  String get ad2 {
    return Intl.message(
      '• Редактировать задачу - нажатие на середину строки с задачей;',
      name: 'ad2',
      desc: '',
      args: [],
    );
  }

  /// `• Задачи без установленной даты завершения автоматически помещаются в раздел "отложенные";`
  String get ad3 {
    return Intl.message(
      '• Задачи без установленной даты завершения автоматически помещаются в раздел "отложенные";',
      name: 'ad3',
      desc: '',
      args: [],
    );
  }

  /// `• Установите лимит задач для главного экрана равным нулю, чтобы скрыть задачи на сегодня`
  String get ad4 {
    return Intl.message(
      '• Установите лимит задач для главного экрана равным нулю, чтобы скрыть задачи на сегодня',
      name: 'ad4',
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

  /// `Weather`
  String get __ {
    return Intl.message(
      'Weather',
      name: '__',
      desc: '',
      args: [],
    );
  }

  /// `Что-то сломалось! Код ошибки:`
  String get errorStatusCode {
    return Intl.message(
      'Что-то сломалось! Код ошибки:',
      name: 'errorStatusCode',
      desc: '',
      args: [],
    );
  }

  /// `{weather, select, clear{Ясно} partlycloudy{Малооблачно} cloudy{С прояснениями} overcast{Пасмурно} lightrain{Небольшой дождь} rain{Дождь} heavyrain{Сильный дождь} showers{Ливень} wetsnow{Дождь со снегом} lightsnow{Небольшой снег} snow{Снег} snowshowers{Снегопад} hail{Град} thunderstorm{Гроза} thunderstormwithrain{Дождь с грозой} thunderstormwithhail{Гроза с градом} other{Странная погода}}`
  String weatherSelect(String weather) {
    return Intl.select(
      weather,
      {
        'clear': 'Ясно',
        'partlycloudy': 'Малооблачно',
        'cloudy': 'С прояснениями',
        'overcast': 'Пасмурно',
        'lightrain': 'Небольшой дождь',
        'rain': 'Дождь',
        'heavyrain': 'Сильный дождь',
        'showers': 'Ливень',
        'wetsnow': 'Дождь со снегом',
        'lightsnow': 'Небольшой снег',
        'snow': 'Снег',
        'snowshowers': 'Снегопад',
        'hail': 'Град',
        'thunderstorm': 'Гроза',
        'thunderstormwithrain': 'Дождь с грозой',
        'thunderstormwithhail': 'Гроза с градом',
        'other': 'Странная погода',
      },
      name: 'weatherSelect',
      desc: 'A weather message',
      args: [weather],
    );
  }

  /// `{wind, select, nw{Ветер северо-западный} n{Ветер северный} ne{Ветер северо-восточный} e{Ветер восточный} se{Ветер юго-восточный} s{Ветер южный} sw{Ветер юго-западный} w{Ветер западный} other{Штиль}}`
  String windSelect(String wind) {
    return Intl.select(
      wind,
      {
        'nw': 'Ветер северо-западный',
        'n': 'Ветер северный',
        'ne': 'Ветер северо-восточный',
        'e': 'Ветер восточный',
        'se': 'Ветер юго-восточный',
        's': 'Ветер южный',
        'sw': 'Ветер юго-западный',
        'w': 'Ветер западный',
        'other': 'Штиль',
      },
      name: 'windSelect',
      desc: 'A weather message',
      args: [wind],
    );
  }

  /// `Высокая влажность`
  String get highHumid {
    return Intl.message(
      'Высокая влажность',
      name: 'highHumid',
      desc: '',
      args: [],
    );
  }

  /// `Умеренная влажность`
  String get mediumHumid {
    return Intl.message(
      'Умеренная влажность',
      name: 'mediumHumid',
      desc: '',
      args: [],
    );
  }

  /// `Пониженная влажность`
  String get lowHumid {
    return Intl.message(
      'Пониженная влажность',
      name: 'lowHumid',
      desc: '',
      args: [],
    );
  }

  /// `Высокий УФ индекс`
  String get highUV {
    return Intl.message(
      'Высокий УФ индекс',
      name: 'highUV',
      desc: '',
      args: [],
    );
  }

  /// `Умеренный УФ индекс`
  String get mediumUV {
    return Intl.message(
      'Умеренный УФ индекс',
      name: 'mediumUV',
      desc: '',
      args: [],
    );
  }

  /// `Низкий УФ индекс`
  String get lowUV {
    return Intl.message(
      'Низкий УФ индекс',
      name: 'lowUV',
      desc: '',
      args: [],
    );
  }

  /// `м/с`
  String get windSpeed {
    return Intl.message(
      'м/с',
      name: 'windSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Errors`
  String get ___ {
    return Intl.message(
      'Errors',
      name: '___',
      desc: '',
      args: [],
    );
  }

  /// `Сервис геолокации на устройстве отключен`
  String get locationError {
    return Intl.message(
      'Сервис геолокации на устройстве отключен',
      name: 'locationError',
      desc: '',
      args: [],
    );
  }

  /// `Сервис геолокации на устройстве недоступен`
  String get locationDenied {
    return Intl.message(
      'Сервис геолокации на устройстве недоступен',
      name: 'locationDenied',
      desc: '',
      args: [],
    );
  }

  /// `Сервис геолокации на устройстве отключен, невозможно запросить разрешение`
  String get locationPermDenied {
    return Intl.message(
      'Сервис геолокации на устройстве отключен, невозможно запросить разрешение',
      name: 'locationPermDenied',
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

  /// `Assets`
  String get ____ {
    return Intl.message(
      'Assets',
      name: '____',
      desc: '',
      args: [],
    );
  }

  /// `assets/images/wind_icon.png`
  String get windAsset {
    return Intl.message(
      'assets/images/wind_icon.png',
      name: 'windAsset',
      desc: '',
      args: [],
    );
  }

  /// `assets/images/drop_icon.png`
  String get dropAsset {
    return Intl.message(
      'assets/images/drop_icon.png',
      name: 'dropAsset',
      desc: '',
      args: [],
    );
  }

  /// `assets/images/sun_icon.png`
  String get sunAsset {
    return Intl.message(
      'assets/images/sun_icon.png',
      name: 'sunAsset',
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
