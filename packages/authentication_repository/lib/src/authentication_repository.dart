import 'package:bcrypt/bcrypt.dart';
import 'package:authentication_repository/src/authentication_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/models.dart';

class AuthenticationRepository implements AuthenticationInterFace {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId == null) {
      return null;
    }

    final doc = await _firestore.collection('users').doc(userId).get();

    if (doc.exists) {
      return User.fromDocument(doc);
    }

    return null;
  }

  @override
  Future<void> signUp(
      {required String username,
      required String password,
      required String name,
      required String phone,
      required String imagePath}) async {
    try {
      final hashedPassword = hashPassword(password);

      await _firestore.collection('users').add({
        'username': username,
        'hash': hashedPassword,
        'name': name,
        'phone': phone,
        'imagePath': imagePath,
      });
    } catch (error) {
      if (kDebugMode) {
        print("เกิดข้อผิดพลาด: $error");
      }
    }
  }

  Future<bool> isUsernameTaken(String username) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    return result.docs.isNotEmpty;
  }

  @override
  Future<User> logIn(
      {required String username, required String password}) async {
    final userSnapshot = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();

    if (userSnapshot.docs.isEmpty) {
      throw Exception('User not found');
    }

    final user = User.fromDocument(userSnapshot.docs.first);
    final checkPassword = verifyPassword(password, user.hash);
    if (!checkPassword) {
      throw Exception('Invalid password');
    }

    // Save user data to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', user.id);

    return user; // Return user
  }

  @override
  Future<void> logOut() async {
    // Clear user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  bool verifyPassword(String password, String hashedPassword) {
    return BCrypt.checkpw(password, hashedPassword);
  }
}
