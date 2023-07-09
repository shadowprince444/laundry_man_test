import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/theme/text_themes.dart';

import '../../../utils/screen_utils/widgets/spacing_widgets.dart';
import '../../../viewmodels/home_viewmodel.dart';

class LaundryOfferWidget extends StatelessWidget {
  const LaundryOfferWidget({
    super.key,
    required this.controller,
  });

  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    final customCardBoxDecoration = BoxDecoration(
      color: const Color(0xeff18202E),
      borderRadius: BorderRadius.circular(
        8.vdp(),
      ),
    );
    return Container(
      height: 190.vdp(),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.vdp(),
        bottom: 16.vdp(),
        left: 16.hdp(),
      ),
      decoration: customCardBoxDecoration,
      child: ListView.separated(
          itemCount: controller.laundryData.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const HSpace(16),
          itemBuilder: (context, index) {
            final model = controller.laundryData[index];
            return Container(
              height: 158.vdp(),
              width: 289.hdp(),
              padding: EdgeInsets.symmetric(
                vertical: 24.vdp(),
                horizontal: 12.hdp(),
              ),
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? const Color(0xeffFFBC99)
                    : const Color(0xeffE9F6FC),
                borderRadius: BorderRadius.circular(
                  14.vdp(),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: AppTextThemes().headline4.copyWith(
                              color: const Color(0xFF33383F),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.23, // line-height equivalent
                            ),
                      ),
                      SizedBox(width: 4.hdp()),
                      Icon(
                        Icons.info,
                        color: const Color(0xFF33383F),
                        size: 16.vdp(),
                      ),
                    ],
                  ),
                  const VSpace(8),
                  Text(
                    'Get ${(model.offerPercentage.ceil())}%',
                    maxLines: 1,
                    style: AppTextThemes().headline4.copyWith(
                          color: const Color(0xFF1A1D1F),
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                  ),
                  const VSpace(6),
                  Container(
                    width: 106,
                    height: 30,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color(0xFFFD955F)
                          : const Color(0xeff83C1DE),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Grab Offer',
                          style: AppTextThemes().bodyText1.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1.71,
                                color: Colors.white,
                              ),
                        ),
                        const SizedBox(width: 9),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 7.vdp(),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
