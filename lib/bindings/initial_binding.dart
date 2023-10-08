import 'package:authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
    Get.put(AuthController());
    Get.put(StorageManage());
  }
}
