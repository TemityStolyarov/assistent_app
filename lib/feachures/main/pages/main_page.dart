import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/widgets/error_container.dart';
import 'package:assistent_app/feachures/main/widgets/no_tasks_today_container.dart';
import 'package:assistent_app/feachures/main/widgets/weather_statistic.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assistent_app/core/utils/routes/app_router.gr.dart';
import 'package:assistent_app/feachures/main/bloc/main_page_bloc.dart';
import 'package:assistent_app/feachures/main/widgets/custom_background_container.dart';
import 'package:assistent_app/feachures/main/widgets/custom_task_tile.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/feachures/widgets/custom_rounded_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      create: (context) => MainPageBloc(),
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          context.read<MainPageBloc>().add(MainPageOnChangeEvent());
          if (state is MainPageOnChangeState) {
            return _MainPageBody(limit: state.limit);
          }
          return ErrorContainer(
            errorMessage: S.of(context).error_on_loading_main_page,
            isScaffoldNeeded: true,
          );
        },
      ),
    );
  }
}

class _MainPageBody extends StatelessWidget {
  final int limit;
  const _MainPageBody({
    required this.limit,
  });

  //TODO Remove tasks before publishing
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
                      const WeatherStatisticHeader(),
                      SizedBox(height: 16.sp),
                      const WeatherStatisticDetails(),
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
                      if (tasksBox.length != 0 && limit == 0)
                        const NoTasksTodayContainer(
                          isAllTaskHidden: true,
                        )
                      else
                        tasksBox.length <= 0
                            ? const NoTasksTodayContainer(
                                isAllTaskHidden: false,
                              )
                            : AnimatedSize(
                                curve: Curves.easeOut,
                                alignment: Alignment.topCenter,
                                duration: const Duration(milliseconds: 300),
                                child: TileContainer(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.sp),
                                        child: TaskList(
                                          limit: limit,
                                        ),
                                      ),
                                      tasksBox.length <= limit
                                          ? const SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.sp,
                                                    vertical: 6.sp,
                                                  ),
                                                  child: CustomText(
                                                    text:
                                                        '${S.of(context).and} ${tasksBox.length - limit} ${S.of(context).tasks(tasksBox.length - limit)} ${S.of(context).for_today}',
                                                    fontSize: 14.sp,
                                                    color: fontColorSubtitle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
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
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const SettingsRoute());
                          Future.delayed(const Duration(milliseconds: 150))
                              .then((value) {
                            SystemChrome.setSystemUIOverlayStyle(
                              const SystemUiOverlayStyle(
                                systemNavigationBarColor: Colors.white,
                              ),
                            );
                          });
                        },
                        child: Row(
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
