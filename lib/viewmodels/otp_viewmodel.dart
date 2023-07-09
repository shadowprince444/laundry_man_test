import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_service.dart';

class OtpViewModel extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final String verificationId;
  final FirebaseService _firebaseService;

  OtpViewModel(this.verificationId, this._firebaseService);

  void submitOtp() async {
    String otp = otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _firebaseService.signInWithCredential(credential);
      // Navigate to home screen
      Get.offNamed('/home');
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}





