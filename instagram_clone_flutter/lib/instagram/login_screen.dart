// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:practice_widgets/firebase_services/auth_service.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/main_screen.dart';
import 'package:practice_widgets/instagram/phone_number_page.dart';
import 'package:practice_widgets/instagram/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  final storage = const FlutterSecureStorage();
  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        String result = await Authentication()
            .login(email: email.text, password: password.text);

        if (result == "success") {
          await storage.write(key: 'email', value: email.text);
          await storage.write(key: 'password', value: password.text);
          await storage.write(key: 'isLoggedIn', value: 'true');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login failed: $result')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${e.toString()}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 200),
              Column(children: [
                const Image(
                  height: 60,
                  width: 180,
                  image: AssetImage(Assets.assetsImgLogo),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    enableIMEPersonalizedLearning: true,
                    autocorrect: true,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      fillColor: Colors.grey.shade700,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: 'Phone number, email or username',
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: password,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: true,
                        autofillHints: const [AutofillHints.password],
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            fillColor: Colors.grey.shade700,
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Password'),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        })),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text('Forgotten password?',
                                  style: TextStyle(color: Colors.blue)))
                        ])),
                const SizedBox(height: 20),
                InkWell(
                    onTap: _login,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))))),
              ]),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text("Or",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account? ",
                    style: TextStyle(color: Colors.white)),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(" Sign up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: const Text("Or",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PhoneLoginScreen()));
                  },
                  label: const Text("Login with Phone number",
                      style: TextStyle(color: Colors.blue)),
                  icon: const Icon(Icons.phone, color: Colors.blue))
            ],
          ),
        ),
      ),
    );
  }
}
