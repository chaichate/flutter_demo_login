import 'package:flutter/material.dart';
import 'package:flutter_demo_login/routs/app_routes.dart';
import 'package:get/get.dart';
import '../../commons/buttons/btn_primary.dart';
import '../../commons/input/password_field.dart';
import '../../commons/input/text_input.dart';
import '../../constants/styles.dart';
import '../../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Form(
                      key: controller.formKeyLogin,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60.0),
                          Image.asset('assets/images/asset-02.png'),
                          const SizedBox(height: 60.0),
                          const Text(
                            "เข้าสู่ระบบ",
                          ),
                          const SizedBox(height: 5.0),
                          TextInputField(
                            labelText: 'Username',
                            textEditingController:
                                controller.usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          PasswordInputField(
                            labelText: 'Password',
                            textEditingController:
                                controller.passwordController,
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
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "ลืมรหัสผ่าน",
                                style: Styles.bodyS,
                              )),
                          const SizedBox(height: 16.0),
                          Center(
                            child: BtnPrimary(
                              onPressed: () {
                                if (controller.formKeyLogin.currentState!
                                    .validate()) {
                                  controller.login();
                                }
                              },
                              title: "เข้าสู่ระบบ",
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.regis);
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: Styles.bodyM,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'คุณยังไม่มีบัญชีผู้ใช้งาน ? '),
                                    TextSpan(
                                        text: 'สมัครสมาชิก',
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
        ));
  }
}
