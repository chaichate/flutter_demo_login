import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routs/app_routes.dart';

class AuthController extends GetxController {
  final AuthenticationRepository authenRepository =
      Get.find<AuthenticationRepository>();

  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final Rx<User?> currentUser = Rx<User?>(null);
  RxBool isUserLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUser();
  }

  _loadCurrentUser() async {
    try {
      User? user = await authenRepository.getCurrentUser();
      currentUser.value = user;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load current user: $e');
    } finally {
      isUserLoaded.value = true;
    }
  }

  void login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }
    isLoading.value = true;

    try {
      // Save to authen_repository
      User user = await authenRepository.logIn(
        username: username,
        password: password,
      );

      currentUser.value = user;

      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    try {
      await authenRepository.logOut();

      currentUser.value = null;

      Get.snackbar('Success', 'Logged out successfully');
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: $e');
    }
  }
}
