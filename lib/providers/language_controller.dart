import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  String _currentLanguageCode = 'en'; // Default language is English

  LanguageProvider() {
    _loadLanguage();
  }

  String get currentLanguageCode => _currentLanguageCode;

  String getTranslatedString(BuildContext context, String key) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var translations = {
      'en': {'greeting': 'Hello'},
      'es': {'greeting': 'Hola'},
    };
    return translations[languageProvider.currentLanguageCode]![key] ?? key;
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    _currentLanguageCode = _prefs.getString('language_code') ?? 'en';
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    if (_currentLanguageCode != languageCode) {
      _currentLanguageCode = languageCode;
      notifyListeners();

      // Save the language code to shared preferences
      await _prefs.setString('language_code', languageCode);
    }
  }
}
