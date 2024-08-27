// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_widgets/firebase_services/auth_service.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/utils/dialog_box.dart';

import '../utils/image_picker.dart';

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
                    File? imagefilee =
                        await ImagePickerr().uploadImage('gallery');
                    if (imagefilee != null) {
                      setState(() {
                        _imageFile = imagefilee;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('No image selected.'),
                      ));
                    }
                  },
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.grey,
                    child: _imageFile == null
                        ? CircleAvatar(
                            radius: 55.r,
                            backgroundImage:
                                const AssetImage(Assets.assetsImgProfile),
                            backgroundColor: Colors.grey.shade200,
                          )
                        : CircleAvatar(
                            radius: 55.r,
                            backgroundImage: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ).image,
                            backgroundColor: Colors.grey.shade200,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                ..._buildTextFields(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    final textFieldsData = [
      {
        'hintText': 'Email',
        'controller': email,
        'icon': Icons.email,
        'obscureText': false,
      },
      {
        'hintText': 'Username',
        'controller': username,
        'icon': Icons.person,
        'obscureText': false,
      },
      {
        'hintText': 'Bio',
        'controller': bio,
        'icon': Icons.info,
        'obscureText': false,
      },
      {
        'hintText': 'Password',
        'controller': password,
        'icon': Icons.lock,
        'obscureText': true,
      },
      {
        'hintText': 'Confirm Password',
        'controller': passwordConfirme,
        'icon': Icons.lock_outline,
        'obscureText': true,
      },
    ];

    return textFieldsData
        .map((data) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _buildTextField(
                hintText: data['hintText'] as String,
                controller: data['controller'] as TextEditingController,
                icon: data['icon'] as IconData,
                obscureText: data['obscureText'] as bool,
              ),
            ))
        .toList();
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        fillColor: Colors.grey.shade700,
        filled: true,
        constraints: const BoxConstraints.tightFor(width: 327, height: 50),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
