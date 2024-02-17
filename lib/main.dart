import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_testtask/controller/language_controller.dart';
import 'package:weatherapp_testtask/screens/home_screen.dart';
import 'package:weatherapp_testtask/utils/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(LanguageController().loadSelectedLanguage());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());
    return GetMaterialApp(
      title: "Weather",
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: controller.selectedLanguage.isNotEmpty
          ? Locale(controller.selectedLanguage.value)
          : null,
      home: HomeScreen(),
    );
  }
}
