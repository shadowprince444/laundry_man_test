import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/text_themes.dart';
import 'package:laundryman/views/widgets/custom_text_field.dart';
import 'package:laundryman/views/widgets/primary_button.dart';
import '../utils/screen_utils/widgets/responsive_safe_area.dart';
import '../utils/theme/colors.dart';
import '../viewmodels/sign_in_view_model.dart';

class SignInScreen extends GetWidget<SignInViewModel> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appTextThemes = AppTextThemes();
    return Scaffold(
      backgroundColor: Color(0xeff0F1621),
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
              Icon(
                size: 25.vdp(),
                Icons.arrow_back,
                color: Colors.white,
              ),
              const VSpace(42),
              Text(
                "Welcome! 👋",
                style: appTextThemes.headline3.copyWith(color: Colors.white),
              ),
              Text(
                "Welcome back, Sign in to your account",
                style: appTextThemes.bodyText2.copyWith(color: Colors.white),
              ),
              const VSpace(29),
              CustomTextField(
                textEditingController: controller.nameController,
                labelText: 'email',
              ),
              const VSpace(16),
              GetBuilder<SignInViewModel>(builder: (signInController) {
                return CustomTextField(
                  suffixIcon: signInController.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  textEditingController: controller.phoneNumberController,
                  textInputType: TextInputType.phone,
                  obscureText: controller.isPasswordVisible,
                  onSuffixIconTapped: signInController.changePasswordVisibility,
                  labelText: 'password',
                );
              }),
              const VSpace(24),
              Text(
                "Forgot Password",
                style: AppTextThemes()
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const VSpace(45),
              PrimaryButton(labelText: "Sign In", onTap: () {}),
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
                          text: "Don't have an account? ",
                          style: appTextThemes.bodyText2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: appTextThemes.bodyText2.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed("/signup");
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
}
