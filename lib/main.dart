import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_apps/app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather Apps',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}