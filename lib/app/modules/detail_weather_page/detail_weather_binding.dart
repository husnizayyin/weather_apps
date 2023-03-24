import 'dart:ffi';

import 'package:get/get.dart';
import 'package:weather_apps/app/data/providers/weather_provider.dart';
import 'package:weather_apps/app/modules/detail_weather_page/detail_weather_controller.dart';

class DetailWeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherProvider>(() => WeatherProvider());
    Get.lazyPut<DetailWeatherController>(() => DetailWeatherController(weatherProvider: Get.find()));
  }
}