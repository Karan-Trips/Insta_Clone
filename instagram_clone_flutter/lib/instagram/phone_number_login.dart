// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice_widgets/instagram/home_screen.dart';

class OtpPage extends StatelessWidget {
  final String verificationId;

  OtpPage({super.key, required this.verificationId});

  final TextEditingController _otpController = TextEditingController();

  void _verifyOtp(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final smsCode = _otpController.text.trim();

    if (smsCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the OTP.')),
      );
      return;
    }

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              const HomeScreen())); // Go back to the previous screen or home page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP',
                hintText: 'Enter OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () => _verifyOtp(context),
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
