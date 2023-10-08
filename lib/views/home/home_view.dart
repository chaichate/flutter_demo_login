import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../commons/buttons/btn_primary.dart';
import '../../constants/styles.dart';
import '../../controllers/auth_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Obx(
            () => authController.currentUser.value != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "เข้าสู่ระบบสำเร็จ",
                          style: Styles.h6.copyWith(
                            color: Styles.greyColor600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: AspectRatio(
                          aspectRatio: 4 / 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  authController.currentUser.value!.imagePath,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey[300]!,
                                child: const Center(child: Icon(Icons.close)),
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ส่วนตัว",
                          style: Styles.bodyM.copyWith(
                            color: Styles.greyColor600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                          color: Styles.greyColor100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "ชื่อ : ${authController.currentUser.value!.name}",
                          style:
                              Styles.bodyM.copyWith(color: Styles.greyColor600),
                        ),
                      ),
                      Container(
                          height: 3,
                          width: double.infinity,
                          color: Styles.greyColor300),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                          color: Styles.greyColor100,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "เบอร์โทร : ${authController.currentUser.value!.phone}",
                          style:
                              Styles.bodyM.copyWith(color: Styles.greyColor600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "บัญชี",
                          style: Styles.bodyM.copyWith(
                            color: Styles.greyColor600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                          color: Styles.greyColor100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "username : ${authController.currentUser.value!.username}",
                          style:
                              Styles.bodyM.copyWith(color: Styles.greyColor600),
                        ),
                      ),
                      Container(
                          height: 3,
                          width: double.infinity,
                          color: Styles.greyColor300),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                          color: Styles.greyColor100,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "password : **********",
                          style:
                              Styles.bodyM.copyWith(color: Styles.greyColor600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: BtnPrimary(
                          onPressed: () {
                            authController.logout();
                          },
                          title: "ล๊อกเอ้า",
                        ),
                      ),
                    ],
                  )
                : Center(child: Text("Not logged in")),
          ),
        )));
  }
}
