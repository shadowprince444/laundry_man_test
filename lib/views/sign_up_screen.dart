import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/text_themes.dart';
import 'package:laundryman/viewmodels/home_viewmodel.dart';
import 'package:laundryman/views/widgets/custom_text_field.dart';
import 'package:laundryman/views/widgets/primary_button.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../utils/screen_utils/widgets/responsive_safe_area.dart';
import '../utils/theme/colors.dart';
import '../viewmodels/phone_number_viewmodel.dart';

class SignUpScreen extends GetWidget<SignUpViewModel> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appTextThemes = AppTextThemes();
    return Scaffold(
      backgroundColor: const Color(0xeff0F1621),
      body: ResponsiveSafeArea(builder: (context, size) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.vdp(),
            horizontal: 22.hdp(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  size: 25.vdp(),
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const VSpace(42),
              Text(
                "Welcome! 👋",
                style: appTextThemes.headline3.copyWith(color: Colors.white),
              ),
              Text(
                "Create your account",
                style: appTextThemes.bodyText2.copyWith(color: Colors.white),
              ),
              const VSpace(29),
              GetBuilder<SignUpViewModel>(builder: (signUpModel) {
                if (signUpModel.verificationId == null) {
                  return otpRequestWidget();
                } else {
                  return Column(
                    children: [
                      PinFieldAutoFill(
                        decoration: UnderlineDecoration(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          colorBuilder: FixedColorBuilder(
                            Colors.white.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        controller: signUpModel.otpController,
                        onCodeSubmitted: (code) {
                          signUpModel.submitOtp(code);
                        },
                        onCodeChanged: (code) async {
                          if (code!.length == 6) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            await signUpModel.submitOtp(code);
                          }
                        },
                      ),
                      const VSpace(36),
                    ],
                  );
                }
              }),
              GetBuilder<SignUpViewModel>(builder: (signUpViewModel) {
                if (signUpViewModel.isLoading) {
                  return const VSpace(0);
                }
                if (signUpViewModel.verificationId == null) {
                  return Center(
                    child: PrimaryButton(
                        labelText: "Next",
                        onTap: () {
                          if (controller.nameController.text.isEmpty) {
                            Get.snackbar(
                              "Invald name",
                              "Please enter your full name",
                              backgroundColor: primaryColor,
                              colorText: Colors.white,
                            );
                          } else {
                            if (controller.phoneNumberController.text.length ==
                                    13 &&
                                controller.phoneNumberController.text
                                    .contains("+91")) {
                              controller.submitPhoneNumber();
                            } else {
                              Get.snackbar(
                                "Invalid Mobile number",
                                "Please enter your country code as well",
                                backgroundColor: primaryColor,
                                colorText: Colors.white,
                              );
                            }
                          }
                        }),
                  );
                } else {
                  return Center(
                    child: PrimaryButton(
                        labelText: "Verify OTP",
                        onTap: () async {
                          if (controller.nameController.text.length == 6) {
                            await controller.submitOtp(null);
                          } else {
                            Get.snackbar(
                              "Invalid OTP",
                              "Please enter your 6 letter OTP",
                              backgroundColor: primaryColor,
                              colorText: Colors.white,
                            );
                          }
                        }),
                  );
                }
              }),
              const Expanded(
                child: SizedBox(),
              ),
              Center(
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
                              Get.offNamed("/signin");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Column otpRequestWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTextField(
          textEditingController: controller.nameController,
          labelText: 'Full Name',
        ),
        const VSpace(16),
        CustomTextField(
          textEditingController: controller.phoneNumberController,
          textInputType: TextInputType.phone,
          labelText: 'Mobile Number',
        ),
        const VSpace(36),
        // PrimaryButton(
        //     labelText: "Next",
        //     onTap: () {
        //       controller.submitPhoneNumber();
        //     }),
      ],
    );
  }
}
