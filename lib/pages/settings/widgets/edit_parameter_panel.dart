import 'package:assistent_app/generated/l10n.dart';
import 'package:assistent_app/utils/color_palette.dart';
import 'package:assistent_app/pages/widgets/custom_rounded_button.dart';
import 'package:assistent_app/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditParameterPanel extends StatefulWidget {
  const EditParameterPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<EditParameterPanel> createState() => _EditParameterPanelState();
}

class _EditParameterPanelState extends State<EditParameterPanel> {
  final TextEditingController _parameter = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _parameter.dispose();
    super.dispose();
  }

  void _editParameter(String limit) async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('limit', int.parse(limit));
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final S locale = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Form(
          key: _formKey,
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
              CustomNumberTextField(
                controller: _parameter,
                text: locale.parameterValue,
                required: true,
              ),
              SizedBox(height: 30.sp),
              RoundedButton(
                title: locale.confirmButtion,
                fontSize: 16.sp,
                width: 181.sp,
                height: 50.sp,
                onPressed: () {
                  _editParameter(_parameter.text);
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
