import 'models/models.dart';

abstract class AuthenticationInterFace {
  Future<void> signUp(
      {required String username,
      required String password,
      required String name,
      required String phone,
      required String imagePath});
  Future<void> logIn({required String username, required String password});
  Future<void> logOut();
  Future<User?> getCurrentUser();
}
