import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/firebase_service.dart';

class SignInViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FirebaseService _firebaseService;

  SignInViewModel(this._firebaseService);
  bool isPasswordVisible = false;
  changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
}
