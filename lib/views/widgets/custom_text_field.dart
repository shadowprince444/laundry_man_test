import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';

import '../../utils/theme/text_themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    this.textInputType,
    this.labelColor,
    this.obscureText,
    this.filled,
    required this.labelText,
    this.labelStyle,
    this.contentPading,
    this.suffixIcon,
    this.onSuffixIconTapped,
  });
  final TextInputType? textInputType;
  final Color? labelColor;
  final bool? obscureText;
  final IconData? suffixIcon;
  final bool? filled;
  final String labelText;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPading;
  final TextEditingController textEditingController;
  final Function()? onSuffixIconTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.hdp(),
      child: TextField(
        style: AppTextThemes().bodyText2.copyWith(
              color: Colors.white,
            ),
        obscureText: obscureText ?? false,
        controller: textEditingController,
        keyboardType: textInputType ?? TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onSuffixIconTapped,
            child: Icon(
              suffixIcon,
              color: Colors.white,
              size: 25.vdp(),
            ),
          ),
          filled: filled ?? true,
          contentPadding: contentPading ?? EdgeInsets.all(16.vdp()),
          fillColor: labelColor ?? const Color(0xff18202E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16..vdp())),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: labelStyle ??
              AppTextThemes()
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
          labelText: labelText,
        ),
      ),
    );
  }
}
