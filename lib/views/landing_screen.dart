import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/views/widgets/primary_button.dart';

import '../utils/screen_utils/widgets/responsive_safe_area.dart';
import '../utils/theme/assets.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/text_themes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appTextThemes = AppTextThemes();
    return Scaffold(
      backgroundColor: const Color(0xeff0F1621),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 302.vdp(),
                  child: Image.asset(
                    laundaryGreenTagLine,
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: size.width / 2 - (97.hdp()),
                  top: 48.2.vdp(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        200.0), // Adjust the radius as needed
                    child: Container(
                      color: const Color(0xeffCABDFF),
                      width: 194.hdp(), // Set the width of the container
                      child: Image.asset(
                        laundryManImage,
                        width: 194.hdp(),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 308.vdp(),
                  child: Image.asset(
                    laundaryVilotTagLine,
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 608.vdp(),
                  child: Align(
                    alignment: Alignment.center,
                    child: PrimaryButton(
                        labelText: "Get Started",
                        onTap: () {
                          Get.toNamed("/signup");
                        }),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 715.vdp(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 9.vdp()),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: appTextThemes.bodyText2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "Sign In",
                              style: appTextThemes.bodyText2.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed("/signin");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
