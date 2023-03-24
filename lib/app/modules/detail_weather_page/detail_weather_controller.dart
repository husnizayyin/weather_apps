import 'dart:convert';

import 'package:get/get.dart';
import 'package:weather_apps/app/data/models/weather.dart';
import 'package:weather_apps/app/data/providers/weather_provider.dart';

class DetailWeatherController extends GetxController {
  final WeatherProvider weatherProvider;

  DetailWeatherController({required this.weatherProvider});

  var isLoading = true.obs;
  final weathers = <Weather>[].obs;

  @override
  void onInit() {
    fetchWeather();
    super.onInit();
  }

  void fetchWeather() async {
    var response = await weatherProvider.fetchWeather();
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      weathers.value = body['list'] == null
        ? []
        : listWeatherFromJson(jsonEncode(body['list']));
    isLoading.value = false;
    update();
    }
  }
}