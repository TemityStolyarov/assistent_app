import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String errorMessage;
  final bool isScaffoldNeeded;
  const ErrorContainer({
    super.key,
    required this.errorMessage,
    required this.isScaffoldNeeded,
  });

  @override
  Widget build(BuildContext context) {
    if (isScaffoldNeeded) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [backgroundElseWeather, backgroundEnd],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: fontColorTitle,
                    ),
                    const SizedBox(height: 80),
                    SizedBox(
                      width: 350,
                      child: CustomText(
                        align: TextAlign.center,
                        fontSize: 14,
                        text: errorMessage,
                        color: fontColorTitle,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 350,
        child: CustomText(
          align: TextAlign.center,
          fontSize: 14,
          text: errorMessage,
          color: fontColorTitle,
          overflow: TextOverflow.visible,
        ),
      );
    }
  }
}
