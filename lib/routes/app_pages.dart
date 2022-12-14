import 'package:films_app/bindings/auth_binding.dart';
import 'package:films_app/bindings/movie_list_binding.dart';
import 'package:films_app/pages/detail_page.dart';
import 'package:films_app/pages/home_page.dart';
import 'package:films_app/pages/login_page.dart';
import 'package:films_app/pages/register_page.dart';
import 'package:films_app/pages/wrapped_list_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: MovieListBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => const DetailPage(),
      binding: MovieListBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.WRAPPEDLIST,
      page: () => const WrappedListPage(),
    )
  ];
}
