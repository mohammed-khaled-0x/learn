import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Register User
  Future<String?> registerUser(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create UserModel
      UserModel newUser = UserModel(
        userId: userCredential.user!.uid,
        username: username,
        email: email,
        role: 'User', // Default role
        isActive: false, // Needs Admin activation
      );

      // Save user data in Firestore
      await _db.collection('users').doc(newUser.userId).set(newUser.toMap());

      return "User registered successfully!";
    } catch (e) {
      return e.toString();
    }
  }

  // Login User
  Future<String?> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "User logged in successfully!";
    } catch (e) {
      return e.toString();
    }
  }
}
