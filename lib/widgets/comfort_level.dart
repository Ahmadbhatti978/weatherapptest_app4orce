import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_testtask/model/weather_data_current.dart';
import 'package:weatherapp_testtask/providers/language_controller.dart';
import 'package:weatherapp_testtask/utils/custom_colors.dart';
import 'package:weatherapp_testtask/utils/languages.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  ComfortLevel({Key? key, required this.weatherDataCurrent}) : super(key: key);

  late LanguageProvider provider;

  String getTranslatedString(BuildContext context, String key) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return trans[languageProvider.currentLanguageCode]![key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: Text(
            getTranslatedString(context, "comfort_level"),
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                      infoProperties: InfoProperties(
                          bottomLabelText:
                              getTranslatedString(context, "humidity"),
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: getTranslatedString(context, "feels_like "),
                          style: TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: "${weatherDataCurrent.current.feelsLike}",
                          style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400))
                    ]),
                  ),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: getTranslatedString(context, "uv_index "),
                          style: TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: "${weatherDataCurrent.current.uvIndex}",
                          style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400))
                    ]),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
