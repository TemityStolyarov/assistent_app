import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/core/utils/routes/app_router.gr.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/feachures/widgets/error_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  // SharedPreferences? prefs;

  // @override
  // void initState() {
  // _initPreference().whenComplete(() {
  //   setState(() {});
  // });
  //   super.initState();
  // }

  // _initPreference() async {
  //   prefs = await SharedPreferences.getInstance();
  //   if (prefs?.getInt('limit') == null) {
  //     await prefs?.setInt('limit', mainScreenTaskListLimit);
  //   }
  // }

  // SharedPreferences? prefs;

  // SharedPreferences? prefs = await SharedPreferences.getInstance();
  // limit: prefs.getInt('limit')!

  _initSettings(BuildContext context) async {
    if (!Hive.isBoxOpen('tasks')) {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDirectory.path);
      Hive.registerAdapter(TaskModelAdapter());
      await Hive.openBox('tasks');
    }
    if (context.mounted) {
      AutoRouter.of(context).push(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initSettings(context),
      builder: ((context, snapshot) {
        if (!snapshot.hasError) {
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
                  const Center(
                    child: CircularProgressIndicator(
                      color: fontColorTitle,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return ErrorContainer(
              errorMessage: snapshot.error.toString(), isScaffoldNeeded: true);
        }
      }),
    );
  }
}
