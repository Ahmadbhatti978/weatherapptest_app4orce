import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_testtask/controller/global_controller.dart';
import 'package:weatherapp_testtask/providers/global_provider.dart';
import 'package:weatherapp_testtask/utils/custom_colors.dart';
import 'package:weatherapp_testtask/widgets/comfort_level.dart';
import 'package:weatherapp_testtask/widgets/current_weather_widget.dart';
import 'package:weatherapp_testtask/widgets/daily_data_forecast.dart';
import 'package:weatherapp_testtask/widgets/header_widget.dart';
import 'package:weatherapp_testtask/widgets/hourly_data_widget.dart';
import 'package:weatherapp_testtask/widgets/languages.button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call
  // final GlobalController globalController =
  //     Get.put(GlobalController(), permanent: true);
  late GlobalProvider provider;

  @override
  void initState() {
    super.initState();
    // Use Future.delayed or Future.microtask to ensure context is available
    Future.delayed(Duration.zero, () {
      provider = Provider.of<GlobalProvider>(context, listen: false);
      if (provider.isLoading) {
        provider.getLocation();
      } else {
        provider.getIndex();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<GlobalProvider>(
            builder: (context, value, child) => value.isLoading
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 200,
                        width: 200,
                      ),
                      const CircularProgressIndicator()
                    ],
                  ))
                : Center(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeaderWidget(),
                            const LanguagesButtons(),
                          ],
                        ),
                        CurrentWeatherWidget(
                          weatherDataCurrent:
                              value.getData().getCurrentWeather(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HourlyDataWidget(
                            weatherDataHourly:
                                value.getData().getHourlyWeather()),
                        DailyDataForecast(
                          weatherDataDaily: value.getData().getDailyWeather(),
                        ),
                        Container(
                          height: 1,
                          color: CustomColors.dividerLine,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ComfortLevel(
                            weatherDataCurrent:
                                value.getData().getCurrentWeather())
                      ],
                    ),
                  )),
      ),
    );
  }
}
