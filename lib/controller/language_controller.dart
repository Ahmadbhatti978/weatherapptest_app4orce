import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();

  RxString selectedLanguage = ''.obs;

  Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    selectedLanguage(languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  Future<void> loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language');
    if (languageCode != null) {
      selectedLanguage(languageCode);
      Get.updateLocale(Locale(languageCode));
    } else {
      Get.updateLocale(Locale('en'));
    }
  }
}
