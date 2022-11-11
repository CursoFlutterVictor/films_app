import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/routes/app_pages.dart';
import 'package:films_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialBinding: BindingsBuilder(
        () {
          Get.put<AuthController>(AuthController());
        },
      ),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
