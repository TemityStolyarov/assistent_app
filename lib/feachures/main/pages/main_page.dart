import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_background_container.dart';
import 'package:assistent_app/feachures/main/widgets/custom_task_tile.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/feachures/widgets/custom_rounded_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  _initDefaultTaskValues() {
    Hive.box('tasks').put(
      0,
      TaskModel(
        name: 'Важная задача',
        note: 'Ни в коем случае нельзя пропустить ее выполнение',
        important: true,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      1,
      TaskModel(
        name: 'Еще одна обычная задача',
        note:
            'Сверстать на Flutter - еще проще, чем сделать дизайн, если честно',
        important: false,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      2,
      TaskModel(
        name: 'Выполненная важная задача',
        note: 'Сделать дизайн страницы - обычное легкое дело',
        important: true,
        isDone: true,
      ),
    );
    Hive.box('tasks').put(
      3,
      TaskModel(
        name: 'Выполненная задача',
        note: 'Это было легко, не так ли?',
        important: false,
        isDone: true,
      ),
    );
    Hive.box('tasks').put(
      4,
      TaskModel(
        name: 'Скрытая задача',
        note: 'Тсс, ее тут нет',
        important: false,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      5,
      TaskModel(
        name: 'Отложенная задача',
        note: 'Кто ж знал, что будет еще один параметр?',
        important: false,
        isDone: false,
      ),
    );
  }

  _getWeather() {
    return 'thunder';
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String dayMonth = DateFormat.MMMMd(locale).format(DateTime.now());
    _initDefaultTaskValues();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          final tasksBox = Hive.box('tasks');
          return SafeArea(
            child: BackgroundContainer(
              weather: _getWeather(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/thunder.png',
                            height: 28.sp,
                          ),
                          SizedBox(width: 10.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '28º',
                                fontSize: 14.sp,
                              ),
                              CustomText(
                                text: 'Гроза',
                                fontSize: 14.sp,
                                fontWeight: fontWeightMedium,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: 'Макс.: 31º, Мин.: 25º',
                                fontSize: 14.sp,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/pin_icon.png',
                                    height: 14.sp,
                                  ),
                                  SizedBox(width: 3.sp),
                                  CustomText(
                                    text: 'Ростов-на-Дону, Россия',
                                    fontSize: 14.sp,
                                    fontWeight: fontWeightMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      TileContainer(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.sp,
                            horizontal: 19.sp,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/wind_icon.png',
                                    height: 24.sp,
                                  ),
                                  SizedBox(width: 8.sp),
                                  CustomText(
                                    text: '2 м/с',
                                    fontSize: 15.sp,
                                    fontWeight: fontWeightMedium,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 206.sp,
                                    child: CustomText(
                                      text: 'Ветер северо-восточный',
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.sp),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/drop_icon.png',
                                    height: 24.sp,
                                  ),
                                  SizedBox(width: 8.sp),
                                  CustomText(
                                    text: '100%',
                                    fontSize: 15.sp,
                                    fontWeight: fontWeightMedium,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 206.sp,
                                    child: CustomText(
                                      text: 'Высокая влажность',
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.sp),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/sun_icon.png',
                                    height: 24.sp,
                                  ),
                                  SizedBox(width: 8.sp),
                                  CustomText(
                                    text: 'УФ 3',
                                    fontSize: 15.sp,
                                    fontWeight: fontWeightMedium,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 206.sp,
                                    child: CustomText(
                                      text: 'Умеренный УФ индекс',
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.sp),
                      Row(
                        children: [
                          CustomText(
                            text: 'Сегодня, ',
                            fontSize: 24.sp,
                          ),
                          CustomText(
                            text: '$dayMonth:',
                            fontSize: 24.sp,
                            fontWeight: fontWeightMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 6.sp),
                      TileContainer(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.sp),
                              child: const TaskList(),
                            ),
                            tasksBox.length > 4
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp,
                                          vertical: 6.sp,
                                        ),
                                        child: CustomText(
                                          text:
                                              'И еще ${tasksBox.length - 4} задачи на сегодня',
                                          fontSize: 14.sp,
                                          color: fontColorSubtitle,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            title: '27 задач отложено',
                            subtitle: 'Хотите разобрать?',
                            onPressed: () {},
                          ),
                          const Spacer(),
                          RoundedButton(
                            title: 'Добавить задачу',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 50.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.settings_outlined,
                            color: backgroundColor,
                          ),
                          SizedBox(width: 4.sp),
                          CustomText(text: 'Параметры', fontSize: 16.sp),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
