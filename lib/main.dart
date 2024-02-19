import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_testtask/controller/language_controller.dart';
import 'package:weatherapp_testtask/providers/global_provider.dart';
import 'package:weatherapp_testtask/providers/language_controller.dart';
import 'package:weatherapp_testtask/screens/home_screen.dart';
import 'package:weatherapp_testtask/utils/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Get.put(LanguageController().loadSelectedLanguage());
  runApp(ChangeNotifierProvider(
      create: (context) => LanguageProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LanguageController());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GlobalProvider(),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, value, child) => MaterialApp(
          title: "Weather",
          debugShowCheckedModeBanner: false,
          locale: value.currentLanguageCode.isNotEmpty
              ? Locale(value.currentLanguageCode)
              : null,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
