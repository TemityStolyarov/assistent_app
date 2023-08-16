import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_background_container.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/main/widgets/custom_tile_container.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/feachures/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Future<void> _initDefaultTaskValues() async {
    await Hive.openBox('tasks');
    Hive.box('tasks').put(
      0,
      TaskModel(
        name: 'Важная задача',
        note: 'Ни в коем случае нельзя пропусти...',
        important: true,
        isDone: false,
      ),
    );
    Hive.box('tasks').put(
      1,
      TaskModel(
        name: 'Выполненная важная задача',
        note: 'Сделать дизайн страницы - обычн...',
        important: true,
        isDone: true,
      ),
    );
    Hive.box('tasks').put(
      2,
      TaskModel(
        name: 'Еще одна обычная задача',
        note: 'Сверстать на Flutter - еще проще, ч...',
        important: false,
        isDone: false,
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
  }

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String dayMonth = DateFormat.MMMMd(locale).format(DateTime.now());

    return FutureBuilder(
      future: _initDefaultTaskValues(),
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return SafeArea(
              child: BackgroundContainer(
                weather: '',
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
                              const _TaskList(),
                              SizedBox(height: 6.sp),
                              CustomText(
                                text: '123',
                                fontSize: 14.sp,
                              ),
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
        );
      },
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({
    Key? key,
  }) : super(key: key);

  void _showConfirmPanel(BuildContext context, TaskModel gift, int index) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200.sp,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Container(
                    height: 4.sp,
                    width: 35.sp,
                    decoration: BoxDecoration(
                      color: backgroundElseWeather,
                      borderRadius: BorderRadius.circular(40.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.sp,
                      vertical: 16.sp,
                    ),
                    child: Text(
                      // S.of(context).confirm_delete_gift(gift.name),
                      'Текст подтверждения',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  RoundedButton(
                    title: 'Удалить',
                    fontSize: 16.sp,
                    width: 181.sp,
                    height: 50.sp,
                    onPressed: () {
                      Hive.box('tasks').deleteAt(index);
                      Navigator.of(context).pop();
                    },
                    // text: S.of(context).delete,
                    buttonColor: backgroundElseWeather,
                  ),
                  //
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('tasks').listenable(),
      builder: (BuildContext context, tasksBox, Widget? child) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final taskModel = Hive.box('tasks').getAt(index) as TaskModel;
            return InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onDoubleTap: () {},
              // => _showConfirmPanel(
              //   context,
              //   taskModel,
              //   index,
              // ),
              child: _TaskTile(
                taskModel: taskModel,
                tasksBox: tasksBox,
                index: index,
              ),
            );
          },
          itemCount: tasksBox.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16.sp);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
        );
      },
    );
  }
}

class _TaskTile extends StatelessWidget {
  final TaskModel taskModel;
  final Box tasksBox;
  final int index;

  const _TaskTile({
    Key? key,
    required this.taskModel,
    required this.tasksBox,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                taskModel.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // GestureDetector(
              //   onTap: openLink,
              //   child: Text(
              //     S.of(context).gift_link,
              //     style: TextStyle(
              //       fontSize: 14.sp,
              //       decoration: TextDecoration.underline,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            // context.read<WishlistPageBloc>().add(
            //       WishlistPageChangeEvent(
            //         index: index,
            //         giftModel: giftModel,
            //       ),
            //     );
          },
          borderRadius: BorderRadius.circular(20.r),
          child: Ink(
            width: 20.sp,
            height: 20.sp,
            decoration: BoxDecoration(
              color: taskModel.isDone ? pointTaskDone : pointTask,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
