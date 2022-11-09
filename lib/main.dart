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
      // Ojo usar home e initialRoute a la vez puede provocar que un Get.off no
      // funcione como se espera, y al pulsar back vuelva a la pagina cerrada-
      // Dejo solo configurado el  initialRoute.
      //home: const LoginPage(),
      //initialRoute: AppRoutes.LOGIN,
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.routes,
    );
  }
}
