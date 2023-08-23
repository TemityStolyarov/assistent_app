import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/feachures/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    FontWeight fontWeight;
    Color tileColor;
    Color strokeColor = backgroundColor.withOpacity(0);
    if (taskModel.isDone) {
      fontWeight = fontWeightRegular;
      tileColor = backgroundColor.withOpacity(0.05);
      if (taskModel.important) {
        fontWeight = fontWeightMedium;
        strokeColor = backgroundColor.withOpacity(0.15);
      }
    } else {
      fontWeight = fontWeightMedium;
      tileColor = backgroundColor.withOpacity(0.2);
      if (taskModel.important) {
        fontWeight = fontWeightBold;
        strokeColor = backgroundColor.withOpacity(0.65);
        tileColor = backgroundColor.withOpacity(0.35);
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        color: tileColor,
        border: Border.all(
          color: strokeColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 13.sp,
          vertical: 7.sp,
        ),
        child: Row(
          children: [
            GestureDetector(
              child: Icon(
                Icons.circle,
                size: 26.spMax,
                color: taskModel.isDone
                    ? backgroundColor.withOpacity(0.15)
                    : backgroundColor.withOpacity(0.4),
              ),
              onTap: () {
                Hive.box('tasks').putAt(
                  index,
                  TaskModel(
                    name: taskModel.name,
                    note: taskModel.note,
                    important: taskModel.important,
                    date: taskModel.date,
                    isDone: !taskModel.isDone,
                  ),
                );
              },
            ),
            SizedBox(width: 13.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 240.sp,
                  ),
                  child: CustomText(
                    text: taskModel.name,
                    color: taskModel.isDone
                        ? fontColorSubtitle.withOpacity(0.9)
                        : fontColorTitle,
                    fontSize: 14.sp,
                    fontWeight: fontWeight,
                    decoration: taskModel.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 240.sp,
                  ),
                  child: CustomText(
                    text: taskModel.note,
                    color: taskModel.isDone
                        ? fontColorSubtitle.withOpacity(0.75)
                        : fontColorSubtitle,
                    fontSize: 14.sp,
                    fontWeight: fontWeightRegular,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  void _showConfirmPanel(BuildContext context, TaskModel task, int index) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
      ),
    );
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
                    child: CustomText(
                      text: 'Вы точно хотите удалить задачу "${task.name}"?',
                      fontSize: 14.sp,
                      overflow: TextOverflow.fade,
                      align: TextAlign.center,
                      color: fontColorBlack,
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
    ).then(
      (value) {
        Future.delayed(const Duration(milliseconds: 200)).then(
          (value) {
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('tasks').listenable(),
      builder: (BuildContext context, tasksBox, Widget? child) {
        return AnimatedSize(
          curve: Curves.easeOut,
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 200),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final taskModel = Hive.box('tasks').getAt(index) as TaskModel;
              return InkWell(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onDoubleTap: () => _showConfirmPanel(
                  context,
                  taskModel,
                  index,
                ),
                child: _TaskTile(
                  taskModel: taskModel,
                  tasksBox: tasksBox,
                  index: index,
                ),
              );
            },
            itemCount: tasksBox.length > 4
                ? tasksBox.length - (tasksBox.length - 4)
                : tasksBox.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 6.sp);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
          ),
        );
      },
    );
  }
}
