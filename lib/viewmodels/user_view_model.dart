import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserViewModel extends GetxController {
  UserViewModel();
  User? _user;
  User? get getUser => _user;
  set setUser(User? user) {
    _user = user;
    update();
  }
}
