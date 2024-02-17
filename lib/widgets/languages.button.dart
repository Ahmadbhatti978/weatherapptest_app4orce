import 'package:flutter/material.dart';
import 'package:weatherapp_testtask/controller/language_controller.dart';

class LanguagesButton extends StatelessWidget {
  const LanguagesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LanguageController.to;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            controller.setLanguage('en_US');
          },
          child: Text('English'),
        ),
        SizedBox(
          width: 20,
        ),
        OutlinedButton(
          onPressed: () {
            controller.setLanguage('ar_ARA');
          },
          child: Text('Arabic'),
        ),
      ],
    );
  }
}
