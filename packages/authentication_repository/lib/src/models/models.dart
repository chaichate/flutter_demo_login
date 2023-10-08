import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String name;
  final String phone;
  final String imagePath;
  final String hash;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.phone,
    required this.imagePath,
    required this.hash,
  });

  factory User.fromDocument(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return User(
      id: snap.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      imagePath: data['imagePath'] ?? '',
      hash: data['hash'] ?? '',
    );
  }

  // If needed, you can also add a method to convert a User object back to a map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'name': name,
      'phone': phone,
      'imagePath': imagePath,
      'hash': hash,
    };
  }
}
