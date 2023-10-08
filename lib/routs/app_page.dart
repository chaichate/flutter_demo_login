import 'package:flutter/material.dart';
import 'package:flutter_demo_login/routs/app_routes.dart';
import 'package:flutter_demo_login/views/home/home_view.dart';
import 'package:flutter_demo_login/views/login/login_view.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../views/loading/loading_view.dart';
import '../views/regis/regis_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.loading,
      page: () => LoadingView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: AppRoutes.regis,
      page: () => const RegisView(),
    ),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  int get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthController>();
    if (!authService.isUserLoaded.value) {
      return const RouteSettings(
          name: AppRoutes.loading); // หน้า loading หรือ splash screen
    }
    if (authService.currentUser.value == null && route != AppRoutes.login) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
