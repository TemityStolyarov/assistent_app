import 'package:assistent_app/data/models/task/task_model.dart';
import 'package:assistent_app/pages/main/widgets/custom_text.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:assistent_app/pages/widgets/custom_rounded_button.dart';
import 'package:assistent_app/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EditTaskPanel extends StatefulWidget {
  final int index;
  const EditTaskPanel({
    super.key,
    required this.index,
  });

  @override
  State<EditTaskPanel> createState() => _EditTaskPanelState();
}

class _EditTaskPanelState extends State<EditTaskPanel> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isDone = false;
  bool isImportant = false;

  @override
  void initState() {
    TaskModel task = Hive.box('tasks').getAt(widget.index);
    _presetValues(task);
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _note.dispose();
    _date.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundEnd,
      ),
    );
    super.dispose();
  }

  void _presetValues(TaskModel task) {
    _name.text = task.name;
    _note.text = task.note;
    _date.text = task.date.toString();
    isDone = task.isDone;
    isImportant = task.isImportant;
  }

  void _editTask(TaskModel task, int index) {
    if (_formKey.currentState!.validate()) {
      Hive.box('tasks').putAt(index, task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 16.sp),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 35.sp,
                      decoration: BoxDecoration(
                        color: backgroundElseWeather,
                        borderRadius: BorderRadius.circular(40.sp),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    CustomTextField(
                      controller: _name,
                      text: 'Название',
                      required: true,
                    ),
                    SizedBox(height: 15.sp),
                    CustomTextField(
                      controller: _note,
                      text: 'Описание',
                      required: true,
                    ),
                    SizedBox(height: 15.sp),
                    CustomDateTextField(
                      predictedDate: DateTime.now(),
                      controller: _date,
                      text: 'Срок выполнения',
                      required: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.sp),
              Row(
                children: [
                  SizedBox(width: 3.sp),
                  Checkbox(
                    side: const BorderSide(width: 1),
                    overlayColor: const MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    fillColor: const MaterialStatePropertyAll(
                      backgroundElseWeather,
                    ),
                    shape: const CircleBorder(eccentricity: 0),
                    value: isImportant,
                    onChanged: (value) {
                      setState(() {
                        isImportant = !isImportant;
                      });
                    },
                  ),
                  CustomText(
                    text: 'Важная задача',
                    fontSize: 16.sp,
                    color: fontColorBlack.withOpacity(0.75),
                    fontWeight: fontWeightRegular,
                  ),
                ],
              ),
              SizedBox(height: 25.sp),
              RoundedButton(
                title: 'Отредактировать',
                fontSize: 16.sp,
                width: 181.sp,
                height: 50.sp,
                onPressed: () {
                  final newTask = TaskModel(
                    name: _name.text,
                    note: _note.text,
                    isImportant: isImportant,
                    isDone: isDone,
                    date: _date.text,
                  );
                  _editTask(newTask, widget.index);
                },
                buttonColor: backgroundElseWeather,
              ),
              SizedBox(height: 291.sp),
            ],
          ),
        ),
      ),
    );
  }
}
