import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/assets.dart';
import 'package:laundryman/utils/theme/text_themes.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customCardBoxDecoration = BoxDecoration(
      color: const Color(0xeff18202E),
      borderRadius: BorderRadius.circular(
        8.vdp(),
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.vdp(),
      ),
      height: 117.vdp(),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.hdp(),
        vertical: 14.vdp(),
      ),
      decoration: customCardBoxDecoration,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        buildCategoryType(Color(0xeffFFBC99), "Wash", washIcon),
        buildCategoryType(Color(0xeffCABDFF), "Iron", ironBoxIcon),
        buildCategoryType(Color(0xeffFFD88D), "Dry Wash", dryWashIcon),
        Column(
          children: [
            Container(
              height: 58.vdp(),
              width: 58.vdp(),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xeff6F767E),
                  border:
                      Border.all(width: 1.vdp(), color: Color(0xeffECECEC))),
              child: Center(
                  child: Icon(
                Icons.arrow_forward,
                color: Color(0xeffECECEC),
                size: 18.hdp(),
              )),
            ),
            VSpace(10),
            Text(
              "See All",
              style: AppTextThemes().subtitle2.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 13.sp(),
                  ),
            )
          ],
        ),
      ]),
    );
  }

  Column buildCategoryType(
      Color backgroundColor, String categoryName, String iconPath) {
    return Column(
      children: [
        Container(
          height: 58.vdp(),
          width: 58.vdp(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              height: 26.vdp(),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        VSpace(10),
        Text(
          categoryName,
          style: AppTextThemes().subtitle2.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 13.sp(),
              ),
        )
      ],
    );
  }
}
