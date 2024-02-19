import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_testtask/api/fetch_weather.dart';
import 'package:weatherapp_testtask/model/weather_data.dart';

class GlobalProvider extends ChangeNotifier {
  // create various variables
  bool _isLoading = true;
  double _latitude = 0.0;
  double _longitude = 0.0;
  int _currentIndex = 0;

  // getters for the variables
  bool get isLoading => _isLoading;
  double get latitude => _latitude;
  double get longitude => _longitude;
  int get currentIndex => _currentIndex;

  var weatherData = WeatherData();

  WeatherData getData() {
    return weatherData;
  }

  // @override
  // void initState() {
  //   if (_isLoading) {
  //     getLocation();
  //   } else {
  //     getIndex();
  //   }
  //   super.initState();
  // }

  void getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      throw Exception("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      throw Exception("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        throw Exception("Location permission is denied");
      }
    }

    // getting the currentposition
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // update our latitude and longitude
    _latitude = position.latitude;
    _longitude = position.longitude;
    // calling our weather api
    final weather = await FetchWeatherAPI().processData(_latitude, _longitude);
    weatherData = weather;
    _isLoading = false;
    notifyListeners();
  }

  int getIndex() {
    return _currentIndex;
  }
}
