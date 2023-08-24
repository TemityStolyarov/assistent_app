import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:assistent_app/feachures/widgets/custom_app_bar.dart';
import 'package:assistent_app/feachures/widgets/custom_scaffold.dart';
import 'package:assistent_app/settings/widgets/edit_parameter_panel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPreferences? prefs;
  int limit = 3;

  @override
  void initState() {
    super.initState();
    _initPreference().whenComplete(() {
      setState(() {});
    });
  }

  _initPreference() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs?.getInt('limit') == null) {
      await prefs?.setInt('limit', mainScreenTaskListLimit);
    }
  }

  void _showSlidingPanel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const EditParameterPanel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return CustomSafeArea(
            scaffold: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(48.sp),
                child: const CustomAppBar(text: 'Параметры'),
              ),
              resizeToAvoidBottomInset: false,
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Настройки:',
                        fontSize: 16.sp,
                        fontWeight: fontWeightMedium,
                        color: backgroundElseWeather,
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _showSlidingPanel(context);
                              },
                              child: const Icon(
                                Icons.edit,
                                color: backgroundElseWeather,
                              )),
                          SizedBox(width: 10.sp),
                          CustomText(
                            text:
                                'Количество задач, отображаемых на главной\nстранице приложения: ${prefs?.getInt('limit')} элемента',
                            fontSize: 14.sp,
                            color: fontColorBlack,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.sp),
                      CustomText(
                        text: 'Советы:',
                        fontSize: 16.sp,
                        fontWeight: fontWeightMedium,
                        color: backgroundElseWeather,
                      ),
                      SizedBox(height: 10.sp),
                      CustomText(
                        text: '• Удалить задачу - двойное нажатие;',
                        fontSize: 14.sp,
                        color: fontColorBlack,
                      ),
                      SizedBox(height: 10.sp),
                      CustomText(
                        text:
                            '• Редактировать задачу - нажатие на середину строки с задачей;',
                        fontSize: 14.sp,
                        color: fontColorBlack,
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 10.sp),
                      CustomText(
                        text:
                            '• Задачи без установленной даты завершения автоматически помещаются в раздел "отложенные"',
                        fontSize: 14.sp,
                        color: fontColorBlack,
                        overflow: TextOverflow.visible,
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
