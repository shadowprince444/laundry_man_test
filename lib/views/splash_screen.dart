import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utils/screen_utils/size_config.dart';
import '../utils/screen_utils/widgets/responsive_safe_area.dart';
import '../utils/theme/text_themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/landing');
      }
    });

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xeff0F1621),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                buildEllipse(
                  color: Colors.white.withOpacity(.1),
                  topPositoin: 308.vdp(),
                  width: 180.vdp(),
                ),
                buildEllipse(
                  color: Colors.white.withOpacity(.25),
                  topPositoin: 318.vdp(),
                  width: 160.vdp(),
                ),
                buildEllipse(
                  color: Colors.white.withOpacity(.40),
                  topPositoin: 328.vdp(),
                  width: 140.vdp(),
                ),
                buildEllipse(
                  color: Colors.white,
                  topPositoin: 338.vdp(),
                  width: 120.vdp(),
                ),
                buildLaundryText(
                  Colors.white,
                  384.vdp(),
                  170.hdp(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned buildEllipse({
    required Color color,
    required double topPositoin,
    required double width,
  }) {
    return Positioned(
      right: 0,
      left: 0,
      top: topPositoin,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1.vdp(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLaundryText(
    Color color,
    double topPositoin,
    double width,
  ) {
    return Align(
        alignment: Alignment.center,
        child: Text(
          "Laundry",
          style: AppTextThemes().headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ));
  }
}
