// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice_widgets/firebase_services/firestore.dart';
import 'package:practice_widgets/firebase_services/storage.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Firebase Auth error";
    } catch (e) {
      return "Something went wrong: ${e.toString()}";
    }
  }

  Future<void> Signup({
    required String email,
    required String password,
    required String passwordConfirme,
    required String username,
    required String bio,
    required File profile,
  }) async {
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordConfirme) {
          // create user with email and password
          await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
          // upload profile image to storage
          if (profile.existsSync()) {
            URL =
                await StorageMethod().uploadImageToStorage('Profile', profile);
          } else {
            URL = ''; // or provide a default URL if necessary
          }

          // get information with Firestore
          await Firebase_Firestor().CreateUser(
            email: email,
            username: username,
            bio: bio,
            profile: URL.isEmpty
                ? 'https://firebasestorage.googleapis.com/v0/b/instagram-8a227.appspot.com/o/person.png?alt=media&token=c6fcbe9d-f502-4aa1-8b4b-ec37339e78ab'
                : URL,
          );
        } else {
          throw Exception('Password and confirm password should be the same.');
        }
      } else {
        throw Exception('Please fill in all the fields.');
      }
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
