import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../commons/buttons/btn_primary.dart';
import '../../commons/input/password_field.dart';
import '../../commons/input/text_input.dart';
import '../../constants/styles.dart';
import '../../controllers/regis_controller.dart';

class RegisView extends StatelessWidget {
  const RegisView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisController controller = Get.put(RegisController());
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black), // Set your desired color here
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/asset-02.png'),
                  const SizedBox(height: 30.0),
                  const Text(
                    "สมัครสมาชิก",
                  ),
                  const SizedBox(height: 5.0),
                  TextInputField(
                    labelText: 'Username',
                    textEditingController: controller.usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 5.0), // Spacing
                  PasswordInputField(
                    labelText: 'Password',
                    textEditingController: controller.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password should be at least 8 characters';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password should contain at least one uppercase letter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5.0),
                  PasswordInputField(
                    labelText: 'Confirm Password',
                    textEditingController: controller.confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != controller.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5.0),

                  TextInputField(
                    labelText: 'Fullname',
                    textEditingController: controller.fullnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a fullname';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5.0),

                  TextInputField(
                    labelText: 'Phone',
                    textEditingController: controller.phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () {
                      controller.upload();
                    },
                    child: Container(
                      width: width,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Styles.greyColor50),
                      child: Obx(
                        () => controller.avatarUrl.value == ''
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add_circle_outline,
                                    size: 50,
                                    color: Styles.greyColor300,
                                  ),
                                  Text(
                                    "อัพโหลดภาพถ่ายประจำตัว",
                                    style: Styles.bodyS.copyWith(
                                      color: Styles.greyColor400,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 100,
                                child: AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          controller.avatarUrl.value ?? '',
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          color: Colors.white,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: Colors.grey[300]!,
                                        child: const Center(
                                            child: Icon(Icons.warning)),
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: BtnPrimary(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.register();
                        }
                      },
                      title: "สมัครสมาชิก",
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: RichText(
                        text: TextSpan(
                          style: Styles.bodyM,
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'คุณมีบัญชีผู้ใช้งานอยู่แล้ว ? '),
                            const TextSpan(
                                text: 'เข้าสู่ระบบ',
                                style: TextStyle(
                                    color: Styles.infoColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
