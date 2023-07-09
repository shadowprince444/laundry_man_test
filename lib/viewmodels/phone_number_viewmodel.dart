import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';

class SignUpViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String? verificationId;
  String? otp;
  bool isLoading = false;
  final FirebaseService _firebaseService;

  SignUpViewModel(this._firebaseService);

  void submitPhoneNumber() async {
    isLoading = true;
    update();
    String phoneNumber = phoneNumberController.text.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-verification logic
        _signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        update();
        // // Navigate to OTP screen
        // Get.toNamed('/otp', arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    isLoading = false;
    update();
  }

  void _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      isLoading = true;
      update();
      await _firebaseService.signInWithCredential(credential);
      isLoading = false;
      update();
      // Navigate to home screen
      Get.offNamed('/home');
    } catch (e) {}
  }

  void submitOtp(String? otp) async {
    isLoading = true;
    update();
    final otpString = otp ?? otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otpString,
      );

      await _firebaseService.signInWithCredential(credential);
      isLoading = true;
      update();
      // Navigate to home screen
      Get.offNamed('/home');
    } catch (e) {
      isLoading = true;
      update();
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    nameController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
