import 'package:films_app/pages/home_page.dart';
import 'package:films_app/routes/app_pages.dart';
import 'package:films_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Forzar orientacion
    //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.routes,
    );
  }
}
