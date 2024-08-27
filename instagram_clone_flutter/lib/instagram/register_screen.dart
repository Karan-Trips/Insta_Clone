import 'package:flutter/material.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/instagram/main_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      image: AssetImage('assets/img/logo.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Sign up to see photos and pictures from your friends",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                width: 327,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.white),
                    SizedBox(width: 7),
                    Text(
                      'Log in with Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade700,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintText: 'Email',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Full Name',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Username',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
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
              const SizedBox(height: 120),
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
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
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
