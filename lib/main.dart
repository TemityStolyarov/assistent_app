import 'package:assistent_app/core/constants.dart';
import 'package:assistent_app/feachures/main/pages/main_page.dart';
import 'package:assistent_app/feachures/task/models/task_model.dart';
import 'package:assistent_app/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  await getApplicationDocumentsDirectory().then(
    (appDocumentDirectory) {
      Hive.init(appDocumentDirectory.path);
    },
  );
  Hive.registerAdapter(TaskModelAdapter());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundEnd,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: MainPage(),
      ),
    );
  }
}
