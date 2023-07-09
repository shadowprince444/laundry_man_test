import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/theme/text_themes.dart';

import '../../utils/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.labelText, required this.onTap, this.width});
  final String labelText;
  final Function() onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 300.hdp(),
        constraints: BoxConstraints(minHeight: 48.vdp()),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            4.vdp(),
          ),
        ),
        child: Center(
          child: Text(
            labelText,
            style: AppTextThemes().bodyText2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}
