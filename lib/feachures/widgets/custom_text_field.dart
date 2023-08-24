import 'package:assistent_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:masked_text/masked_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool required;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.required,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: fontWeightRegular,
      ),
      cursorColor: backgroundElseWeather,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.sp),
          borderSide: const BorderSide(
            color: backgroundElseWeather,
            strokeAlign: BorderSide.strokeAlignOutside,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: backgroundElseWeather,
            strokeAlign: BorderSide.strokeAlignOutside,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: fontColorError,
            width: 1,
          ),
        ),
        labelText: text,
        floatingLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: fontWeightRegular,
          color: fontColorBlack,
        ),
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 12.sp,
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: false,
      ),
      validator: (value) {
        print(value);
        if ((value == null || value.isEmpty) && required) {
          return 'Это поле является обязательным!';
          //return S.of(context).required_field;
        }
        if (int.tryParse(value!) is! int) {
          return 'В этом поле необходимо указать целое число элементов';
        }
        return null;
      },
    );
  }
}

// class CustomNumberTextField extends CustomTextField {
  
//   const CustomNumberTextField({
//     super.key,
//     required super.controller,
//     required super.text,
//     required super.required,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaskedTextField(
//       controller: controller,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//       ),
//       cursorColor: backgroundElseWeather,
//       readOnly: true,
//       onTap: () => _selectDate(context, controller),
//       decoration: InputDecoration(
//         suffixIconColor: backgroundElseWeather,
//         filled: true,
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(4.sp),
//           borderSide: BorderSide.none,
//         ),
//         labelText: text,
//         suffixIcon: IconButton(
//           highlightColor: Colors.transparent,
//           onPressed: () => _selectDate(context, controller),
//           icon: const Icon(Icons.calendar_today),
//         ),
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           color: backgroundElseWeather,
//         ),
//         fillColor: backgroundEnd,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 8.sp,
//           horizontal: 12.sp,
//         ),
//       ),
//       mask: '##.##.####',
//       keyboardType: TextInputType.datetime,
//       validator: (value) {
//         if ((value == null || value.isEmpty) && super.required) {
//           return 'Это поле является обязательным!';
//           //return S.of(context).required_field;
//         }
//         return null;
//       },
//     );
//   }
// }

// class CustomPhoneTextField extends CustomTextField {
//   const CustomPhoneTextField({
//     super.key,
//     required super.controller,
//     required super.text,
//     required super.required,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaskedTextField(
//       controller: controller,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//       ),
//       cursorColor: backgroundElseWeather,
//       decoration: InputDecoration(
//         filled: true,
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(4.sp),
//           borderSide: BorderSide.none,
//         ),
//         labelText: text,
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           color: backgroundElseWeather,
//         ),
//         fillColor: backgroundEnd,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 8.sp,
//           horizontal: 12.sp,
//         ),
//       ),
//       mask: '+# (###) ###-##-##',
//       keyboardType: TextInputType.number,
//     );
//   }
// }

// class CustomDateTextField extends CustomTextField {
//   final DateTime predictedDate;
//   const CustomDateTextField({
//     super.key,
//     required super.controller,
//     required super.text,
//     required super.required,
//     required this.predictedDate,
//   });

//   Future<void> _selectDate(
//     BuildContext context,
//     TextEditingController controller,
//   ) async {
//     String day, month;
//     final DateTime? date = await showDatePicker(
//       context: context,
//       initialEntryMode: DatePickerEntryMode.input,
//       initialDate: predictedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: ThemeData.light()
//                 .colorScheme
//                 .copyWith(primary: backgroundElseWeather),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (date != null) {
//       day = date.day < 10 ? '0${date.day}' : '${date.day}';
//       month = date.month < 10 ? '0${date.month}' : '${date.month}';
//       controller.text = '$day.$month.${date.year}';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaskedTextField(
//       controller: controller,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//       ),
//       cursorColor: backgroundElseWeather,
//       readOnly: true,
//       onTap: () => _selectDate(context, controller),
//       decoration: InputDecoration(
//         suffixIconColor: backgroundElseWeather,
//         filled: true,
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(4.sp),
//           borderSide: BorderSide.none,
//         ),
//         labelText: text,
//         suffixIcon: IconButton(
//           highlightColor: Colors.transparent,
//           onPressed: () => _selectDate(context, controller),
//           icon: const Icon(Icons.calendar_today),
//         ),
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           color: backgroundElseWeather,
//         ),
//         fillColor: backgroundEnd,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 8.sp,
//           horizontal: 12.sp,
//         ),
//       ),
//       mask: '##.##.####',
//       keyboardType: TextInputType.datetime,
//       validator: (value) {
//         if ((value == null || value.isEmpty) && super.required) {
//           return 'Это поле является обязательным!';
//           //return S.of(context).required_field;
//         }
//         return null;
//       },
//     );
//   }
// }

// class ImageTextField extends CustomTextField {
//   const ImageTextField({
//     super.key,
//     required super.controller,
//     required super.text,
//     required super.required,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//       ),
//       cursorColor: backgroundElseWeather,
//       decoration: InputDecoration(
//         counterText: '',
//         filled: true,
//         border: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(4.sp),
//           borderSide: BorderSide.none,
//         ),
//         labelText: text,
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           color: backgroundElseWeather,
//         ),
//         fillColor: backgroundEnd,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 8.sp,
//           horizontal: 12.sp,
//         ),
//       ),
//     );
//   }
// }
