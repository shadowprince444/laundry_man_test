import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/text_themes.dart';

import '../../../utils/theme/assets.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xeFF18202E),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 17.vdp(),
            horizontal: 24.hdp(),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              profilePic,
              height: 30.vdp(),
              width: 30.vdp(),
            ),
            const HSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Location',
                    style:
                        AppTextThemes().subtitle1.copyWith(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        '15A, James Street',
                        style: AppTextThemes().bodyText1.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const HSpace(2),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BRONZE",
                  style: AppTextThemes().subtitle1.copyWith(
                        color: const Color(0xeFFF4BF4B),
                      ),
                ),
                const HSpace(5),
                Text(
                  "0 POINTS",
                  style: AppTextThemes().subtitle1.copyWith(
                        color: Colors.white,
                        fontSize: 8.sp(),
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
            Image.asset(
              badgeIcon,
              width: 24.hdp(),
              fit: BoxFit.fitWidth,
            ),
          ]),
        ),
      ),
    );
  }
}
