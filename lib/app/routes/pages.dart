import 'package:get/get.dart';
import 'package:weather_apps/app/modules/detail_weather_page/detail_weather_binding.dart';
import 'package:weather_apps/app/modules/detail_weather_page/detail_weather_view.dart';
import 'package:weather_apps/app/modules/home_page/home_view.dart';
import 'package:weather_apps/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.detail,
      binding: DetailWeatherBinding(),
      page: () => const DetailWeather(),
      transition: Transition.cupertino,
    ),
  ];
}
