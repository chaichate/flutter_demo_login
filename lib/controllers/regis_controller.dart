import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class RegisController extends GetxController {
  final AuthenticationRepository authenRepository =
      Get.find<AuthenticationRepository>();
  final StorageManage storage = Get.find<StorageManage>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxString avatarUrl = "".obs;

  void register() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullname = fullnameController.text.trim();
    final phone = phoneController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        fullname.isEmpty ||
        phone.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Check if username is taken
      bool usernameTaken = await authenRepository.isUsernameTaken(username);
      if (usernameTaken) {
        Get.back();
        Get.snackbar('Error', 'Username is already taken');
        return;
      }

      // Save to authen_repository
      await authenRepository.signUp(
        username: username,
        password: password,
        name: fullname,
        phone: phone,
        imagePath: avatarUrl.value,
      );

      Get.back();
      Get.back();
      Get.snackbar('Success', 'Registration successful');
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'Registration failed: $e');
    }
  }

  Future<void> upload() async {
    try {
      var uuid = const Uuid();
      var imageName = uuid.v4();
      final pathRef = "/avatars/$imageName.jpeg";

      await storage.pickAndCropImage(pathRef);
      print('uploadFile success');

      avatarUrl.value = await storage.getDownloadURL(pathRef);
    } catch (e) {
      print('Error during upload: $e');
    }
  }
}
