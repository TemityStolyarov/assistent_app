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

  static String m2(weather) => "${Intl.select(weather, {
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
          })}";

  static String m3(wind) => "${Intl.select(wind, {
            'nw': 'Ветер северо-западный',
            'n': 'Ветер северный',
            'ne': 'Ветер северо-восточный',
            'e': 'Ветер восточный',
            'se': 'Ветер юго-восточный',
            's': 'Ветер южный',
            'sw': 'Ветер юго-западный',
            'w': 'Ветер западный',
            'other': 'Штиль',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_": MessageLookupByLibrary.simpleMessage("Settings Page"),
        "__": MessageLookupByLibrary.simpleMessage("Weather"),
        "___": MessageLookupByLibrary.simpleMessage("Errors"),
        "____": MessageLookupByLibrary.simpleMessage("Assets"),
        "ad1": MessageLookupByLibrary.simpleMessage(
            "• Удалить задачу - двойное нажатие;"),
        "ad2": MessageLookupByLibrary.simpleMessage(
            "• Редактировать задачу - нажатие на середину строки с задачей;"),
        "ad3": MessageLookupByLibrary.simpleMessage(
            "• Задачи без установленной даты завершения автоматически помещаются в раздел \"отложенные\";"),
        "ad4": MessageLookupByLibrary.simpleMessage(
            "• Установите лимит задач для главного экрана равным нулю, чтобы скрыть задачи на сегодня"),
        "addButton": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addTaskButton":
            MessageLookupByLibrary.simpleMessage("Добавить задачу"),
        "advices": MessageLookupByLibrary.simpleMessage("Советы"),
        "and": MessageLookupByLibrary.simpleMessage("И еще"),
        "confirmButtion": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "confirmDeletion": MessageLookupByLibrary.simpleMessage(
            "Вы точно хотите удалить задачу"),
        "dateField": MessageLookupByLibrary.simpleMessage("Срок выполнения"),
        "deleteButton": MessageLookupByLibrary.simpleMessage("Удалить"),
        "dropAsset":
            MessageLookupByLibrary.simpleMessage("assets/images/drop_icon.png"),
        "editButton": MessageLookupByLibrary.simpleMessage("Отредактировать"),
        "elements": m0,
        "errorStatusCode": MessageLookupByLibrary.simpleMessage(
            "Что-то сломалось! Код ошибки:"),
        "error_on_loading_main_page": MessageLookupByLibrary.simpleMessage(
            "Произошла непредвиденная ошибка при загрузке главного экрана\n\nПожалуйста, обратитесь в поддержку"),
        "error_on_loading_settings_page": MessageLookupByLibrary.simpleMessage(
            "Произошла непредвиденная ошибка при загрузке экрана настроек\n\nПожалуйста, обратитесь в поддержку"),
        "for_today": MessageLookupByLibrary.simpleMessage("на сегодня"),
        "hiddenTasks": MessageLookupByLibrary.simpleMessage(
            "Задачи на сегодня спрятаны :)"),
        "highHumid": MessageLookupByLibrary.simpleMessage("Высокая влажность"),
        "highUV": MessageLookupByLibrary.simpleMessage("Высокий УФ индекс"),
        "importantField": MessageLookupByLibrary.simpleMessage("Важная задача"),
        "locationDenied": MessageLookupByLibrary.simpleMessage(
            "Сервис геолокации на устройстве недоступен"),
        "locationError": MessageLookupByLibrary.simpleMessage(
            "Сервис геолокации на устройстве отключен"),
        "locationPermDenied": MessageLookupByLibrary.simpleMessage(
            "Сервис геолокации на устройстве отключен, невозможно запросить разрешение"),
        "lowHumid":
            MessageLookupByLibrary.simpleMessage("Пониженная влажность"),
        "lowUV": MessageLookupByLibrary.simpleMessage("Низкий УФ индекс"),
        "mediumHumid":
            MessageLookupByLibrary.simpleMessage("Умеренная влажность"),
        "mediumUV": MessageLookupByLibrary.simpleMessage("Умеренный УФ индекс"),
        "nameField": MessageLookupByLibrary.simpleMessage("Название"),
        "noTasks": MessageLookupByLibrary.simpleMessage("На сегодня задач нет"),
        "noteField": MessageLookupByLibrary.simpleMessage("Описание"),
        "parameterValue":
            MessageLookupByLibrary.simpleMessage("Значение параметра"),
        "parameters": MessageLookupByLibrary.simpleMessage("Параметры"),
        "required_field": MessageLookupByLibrary.simpleMessage(
            "Это поле является обязательным"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "showMore": MessageLookupByLibrary.simpleMessage(
            "Коснитесь для просмотра списка всех задач"),
        "showMoreOtherDays": MessageLookupByLibrary.simpleMessage(
            "Коснитесь для просмотра задач на другие дни"),
        "sunAsset":
            MessageLookupByLibrary.simpleMessage("assets/images/sun_icon.png"),
        "task_amount_showing_on_main_page": MessageLookupByLibrary.simpleMessage(
            "Количество задач, отображаемых на главном\nэкране приложения: до"),
        "tasks": m1,
        "today": MessageLookupByLibrary.simpleMessage("Сегодня,"),
        "uv": MessageLookupByLibrary.simpleMessage("УФ"),
        "weatherSelect": m2,
        "windAsset":
            MessageLookupByLibrary.simpleMessage("assets/images/wind_icon.png"),
        "windSelect": m3,
        "windSpeed": MessageLookupByLibrary.simpleMessage("м/с")
      };
}
