import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/text_themes.dart';

import '../../../utils/theme/assets.dart';

class CleaningServicesWidget extends StatelessWidget {
  const CleaningServicesWidget({
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
      margin: EdgeInsets.only(
        bottom: 5.vdp(),
      ),
      height: 267.vdp(),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.hdp(),
        vertical: 14.vdp(),
      ),
      decoration: customCardBoxDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4.hdp(),
                height: 21.vdp(),
                decoration: BoxDecoration(
                  color: const Color(0xFFCABDFF),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(
                width: 10.hdp(),
              ),
              Expanded(
                child: Text(
                  'Nearest Laundry',
                  style: AppTextThemes().headline1.copyWith(
                        color: Colors.white,
                        fontSize: 18.sp(),
                        fontWeight: FontWeight.w600,
                      ),
                  softWrap: true,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 12.vdp(),
                  horizontal: 10.hdp(),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color.fromRGBO(239, 239, 239, 0.34),
                    width: 0.75,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'See All',
                      style: AppTextThemes().headline1.copyWith(
                            color: const Color(0xFFD1D3D4),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                      softWrap: true,
                    ),
                    const HSpace(4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 10.hdp(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VSpace(12),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.vdp()),
                      child: Image.asset(
                        index % 2 == 0 ? cleaningService1 : cleaningService2,
                        height: 154.vdp(),
                        width: 130.hdp(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const VSpace(8),
                    Text(
                      "Laundry Name",
                      style: AppTextThemes().bodyText1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const HSpace(16),
            ),
          )
        ],
      ),
    );
  }
}
