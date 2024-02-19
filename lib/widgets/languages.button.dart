import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_testtask/providers/language_controller.dart';

class LanguagesButtons extends StatelessWidget {
  const LanguagesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            value: languageProvider.currentLanguageCode,
            onChanged: (value) {
              languageProvider.setLanguage(value!);
            },
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('Arabic'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
