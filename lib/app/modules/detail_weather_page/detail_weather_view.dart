import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_apps/app/data/models/weather.dart';
import 'package:weather_apps/app/modules/detail_weather_page/detail_weather_controller.dart';
import 'package:weather_apps/app/widgets/white_text.dart';

class DetailWeather extends StatefulWidget {
  const DetailWeather({super.key});

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  final controller = Get.find<DetailWeatherController>();

  @override
  Widget build(BuildContext context) {
    var tgl = DateTime.now();
    var formathari = DateFormat('EEEE, MMM dd, yyyy');
    var formatjam = DateFormat('H');
    var tanggal = formathari.format(tgl);
    var j = formatjam.format(tgl);
    final jam = int.parse(j);

    var greeting;

    if (jam >= 4) {
      greeting = 'Selamat Pagi';
    }
    if (jam >= 12) {
      greeting = 'Selamat Siang';
    }
    if (jam >= 15) {
      greeting = 'Selamat Sore';
    }
    if (jam >= 18) {
      greeting = 'Selamat Malam';
    }

    dynamic argsData = Get.arguments;

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${argsData[1]}, ${argsData[2]}'),
                Text(
                  tanggal.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            foregroundColor: Colors.white,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.refresh_outlined),
              ),
            ],
          ),
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: Get.width,
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      greeting + ', ${argsData[0]}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      '28.33 °C',
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(width: Get.width * 0.4),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    controller.isLoading.value
                                        ? const Center(
                                            child: CupertinoActivityIndicator(),
                                          )
                                        : Text(
                                            controller
                                                .weathers[0].weather[0].main
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                    const SizedBox(height: 20),
                                    const Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: middlewidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: Get.height / 1.9,
                            width: Get.width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                ...controller.weathers
                                    .map((element) =>
                                        WeatherPerDay(weather: element))
                                    .toList(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget middlewidget() {
    return Container(
      height: 110,
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.water_drop_rounded,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(height: 8),
              WhiteText(texting: '${controller.weathers[0].main!.humidity}'),
              const WhiteText(texting: 'Humidity'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.speed,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(height: 8),
              WhiteText(texting: '${controller.weathers[0].main!.pressure}'),
              const WhiteText(texting: 'Pressure'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(height: 8),
              WhiteText(texting: '${controller.weathers[0].main!.humidity}'),
              const WhiteText(texting: 'Cloudiness'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.assistant_navigation,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(height: 8),
              WhiteText(texting: '${controller.weathers[0].main!.tempKf} m/s'),
              const WhiteText(texting: 'Wind'),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherPerDay extends StatelessWidget {
  const WeatherPerDay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailWeatherController>();

    var formatHari = DateFormat('E');
    var formatTanggal = DateFormat('M/dd');
    var formatJam = DateFormat('HH:mm');
    var hari = formatHari.format(weather.dtTxt);
    var tanggal = formatTanggal.format(weather.dtTxt);
    var jam = formatJam.format(weather.dtTxt);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              WhiteText(texting: hari.toString()),
              WhiteText(texting: tanggal.toString()),
            ],
          ),
          const SizedBox(width: 10),
          ...controller.weathers
              .map(
                (element) => Column(
                  children: [
                    WhiteText(texting: jam.toString()),
                    const Icon(Icons.cloud, size: 26, color: Colors.white),
                    const WhiteText(texting: '21.99 °C'),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
