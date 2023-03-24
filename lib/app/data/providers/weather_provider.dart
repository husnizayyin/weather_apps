import 'package:weather_apps/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  var url = ApiUrl.baseUrl;

  Future<http.Response> fetchWeather() async {
    return http.get(
      Uri.parse(url)
    );
  }
}