// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice_widgets/firebase_services/auth_service.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/authStore/auth_store.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/utils/dialog_box.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirme = TextEditingController();
  final username = TextEditingController();
  final bio = TextEditingController();
  File? _imageFile;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    passwordConfirme.dispose();
    username.dispose();
    bio.dispose();
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "Registered Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 180,
                      child: Image(
                        image: AssetImage(Assets.assetsImgLogo),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await mainScreen.pickImage('gallery');
                    if (mainScreen.imageFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No image selected.'),
                        ),
                      );
                    }
                  },
                  child: Observer(builder: (_) {
                    return CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Colors.grey,
                      child: mainScreen.imageFile == null
                          ? CircleAvatar(
                              radius: 55.r,
                              backgroundImage:
                                  const AssetImage(Assets.assetsImgProfile),
                              backgroundColor: Colors.grey.shade200,
                            )
                          : Observer(builder: (_) {
                              return CircleAvatar(
                                radius: 55.r,
                                backgroundImage: Image.file(
                                  mainScreen.imageFile!,
                                  fit: BoxFit.cover,
                                ).image,
                                backgroundColor: Colors.grey.shade200,
                              );
                            }),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                _buildEmailField(),
                const SizedBox(height: 15),
                _buildUsernameField(),
                const SizedBox(height: 15),
                _buildBioField(),
                const SizedBox(height: 15),
                _buildPasswordField(),
                const SizedBox(height: 15),
                _buildConfirmPasswordField(),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    try {
                      await Authentication()
                          .Signup(
                        email: email.text,
                        password: password.text,
                        passwordConfirme: passwordConfirme.text,
                        username: username.text,
                        bio: bio.text,
                        profile: _imageFile ?? File(''),
                      )
                          .then((value) {
                        Toastification().showCustom(builder: (context, op) {
                          return const Text('Registered Successfully');
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      });
                    } on Exception catch (e) {
                      dialogBuilder(context, e.toString());
                    }
                  },
                  child: Container(
                    width: 327,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "By signing up, you agree to our Terms and Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                GestureDetector(
                    onTap: () {
                      _showToast();
                    },
                    child: const Text(
                      "asdas",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: email,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
          fillColor: Colors.grey.shade700,
          filled: true,
          constraints: const BoxConstraints.tightFor(width: 327, height: 50),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: 'Email'),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: username,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        fillColor: Colors.grey.shade700,
        filled: true,
        constraints: const BoxConstraints.tightFor(width: 327, height: 50),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Username',
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildBioField() {
    return TextFormField(
      controller: bio,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.info, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        fillColor: Colors.grey.shade700,
        filled: true,
        constraints: const BoxConstraints.tightFor(width: 327, height: 50),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Bio',
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        fillColor: Colors.grey.shade700,
        filled: true,
        constraints: const BoxConstraints.tightFor(width: 327, height: 50),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Password',
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: passwordConfirme,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        fillColor: Colors.grey.shade700,
        filled: true,
        constraints: const BoxConstraints.tightFor(width: 327, height: 50),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Confirm Password',
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
