import 'package:assistent_app/api/weather_model.dart';
import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/features/main/widgets/add_task_panel.dart';
import 'package:assistent_app/features/main/widgets/weather_statistic_details.dart';
import 'package:assistent_app/features/task/models/task_model.dart';
import 'package:assistent_app/features/widgets/error_container.dart';
import 'package:assistent_app/features/main/widgets/no_tasks_today_container.dart';
import 'package:assistent_app/features/main/widgets/weather_statistic.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assistent_app/core/utils/routes/app_router.gr.dart';
import 'package:assistent_app/features/main/bloc/main_page_bloc.dart';
import 'package:assistent_app/features/main/widgets/custom_background_container.dart';
import 'package:assistent_app/features/main/widgets/custom_task_tile.dart';
import 'package:assistent_app/features/main/widgets/custom_text.dart';
import 'package:assistent_app/features/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/features/widgets/custom_rounded_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  final WeatherModel weatherModel;
  const MainPage({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      create: (context) => MainPageBloc(),
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          context.read<MainPageBloc>().add(MainPageOnChangeEvent());
          if (state is MainPageOnChangeState) {
            return MainPageBody(
              weatherModel: weatherModel,
              limit: state.limit,
            );
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

class MainPageBody extends StatelessWidget {
  final WeatherModel weatherModel;
  final int limit;

  const MainPageBody({
    super.key,
    required this.limit,
    required this.weatherModel,
  });

  //TODO Remove tasks before publishing
  _initDefaultTaskValues() {
    Hive.box('tasks').put(
      0,
      TaskModel(
        name: 'Важная задача',
        note: 'Ни в коем случае нельзя пропустить ее выполнение',
        isImportant: true,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      1,
      TaskModel(
        name: 'Еще одна обычная задача',
        note:
            'Сверстать на Flutter - еще проще, чем сделать дизайн, если честно',
        isImportant: false,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      2,
      TaskModel(
        name: 'Выполненная важная задача',
        note: 'Сделать дизайн страницы - обычное легкое дело',
        isImportant: true,
        isDone: true,
      ),
    );
    Hive.box('tasks').put(
      3,
      TaskModel(
        name: 'Выполненная задача',
        note: 'Это было легко, не так ли?',
        isImportant: false,
        isDone: true,
      ),
    );
    Hive.box('tasks').put(
      4,
      TaskModel(
        name: 'Скрытая задача',
        note: 'Тсс, ее тут нет',
        isImportant: false,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      5,
      TaskModel(
        name: 'Отложенная задача',
        note: 'Кто ж знал, что будет еще один параметр?',
        isImportant: false,
        isDone: false,
      ),
    );
  }

  void _showAddTaskSlidingPanel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
          ),
        );
        return const AddTaskPanel();
      },
    ).whenComplete(
      () {
        Future.delayed(const Duration(milliseconds: 200)).whenComplete(
          () {
            SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                systemNavigationBarColor: backgroundEnd,
              ),
            );
          },
        );
      },
    );
  }

  _getWeather() {
    return weatherModel.forecasts[0].parts['day_short']!.condition;
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String dayMonth = DateFormat.MMMMd(locale).format(DateTime.now());
    // _initDefaultTaskValues();
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
                      WeatherStatistic(weatherModel: weatherModel),
                      SizedBox(height: 16.sp),
                      WeatherStatisticDetails(weatherModel: weatherModel),
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
                          // TODO: Задачи без даты вынести в отложенные, затем раскомментить код ниже
                          // RoundedButton(
                          //   title: '27 задач отложено',
                          //   subtitle: 'Хотите разобрать?',
                          //   onPressed: () {},
                          // ),
                          // const Spacer(),
                          RoundedButton(
                            title: 'Добавить задачу',
                            onPressed: () {
                              _showAddTaskSlidingPanel(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50.sp),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const SettingsRoute());
                          Future.delayed(const Duration(milliseconds: 150))
                              .whenComplete(() {
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
