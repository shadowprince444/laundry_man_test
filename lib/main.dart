import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:laundryman/viewmodels/sign_in_view_model.dart';
import 'package:laundryman/views/landing_screen.dart';
import 'package:laundryman/views/sign_in_screen.dart';
import 'package:laundryman/views/splash_screen.dart';
import 'views/sign_up_screen.dart';
import 'views/otp_screen.dart';
import 'views/home/home_screen.dart';
import 'viewmodels/phone_number_viewmodel.dart';
import 'viewmodels/otp_viewmodel.dart';
import 'viewmodels/home_viewmodel.dart';
import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<FirebaseService>(FirebaseService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Authentication',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/landing", page: () => const LandingScreen()),
        GetPage(
          name: '/signin',
          page: () => const SignInScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SignInViewModel>(
                () => SignInViewModel(GetIt.instance.get<FirebaseService>()));
          }),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SignUpViewModel>(
                () => SignUpViewModel(GetIt.instance.get<FirebaseService>()));
          }),
        ),
        GetPage(
          name: '/otp',
          page: () => const OtpScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut<OtpViewModel>(
                () => OtpViewModel("", GetIt.instance.get<FirebaseService>()));
          }),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeViewModel>(
                () => HomeViewModel(GetIt.instance.get<FirebaseService>()));
          }),
        ),
      ],
    );
  }
}
