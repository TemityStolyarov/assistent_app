import 'package:assistent_app/pages/main/widgets/custom_text.dart';
import 'package:assistent_app/pages/settings/bloc/settings_bloc.dart';
import 'package:assistent_app/pages/settings/widgets/edit_parameter_panel.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:assistent_app/pages/widgets/custom_app_bar.dart';
import 'package:assistent_app/pages/widgets/custom_scaffold.dart';
import 'package:assistent_app/pages/widgets/error_container.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          context.read<SettingsBloc>().add(SettingsChangedEvent());
          if (state is SettingsInitializedState) {
            return _SettingsPageBody(limit: state.limit);
          }
          return ErrorContainer(
            errorMessage: S.of(context).error_on_loading_settings_page,
            isScaffoldNeeded: true,
          );
        },
      ),
    );
  }
}

class _SettingsPageBody extends StatelessWidget {
  final int limit;
  const _SettingsPageBody({
    required this.limit,
  });

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
                                '${S.of(context).task_amount_showing_on_main_page} $limit ${S.of(context).elements(limit)}',
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
                            '• Задачи без установленной даты завершения автоматически помещаются в раздел "отложенные";',
                        fontSize: 14.sp,
                        color: fontColorBlack,
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 10.sp),
                      CustomText(
                        text:
                            '• Установите лимит задач для главного экрана равным нулю, чтобы скрыть задачи на сегодня',
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
