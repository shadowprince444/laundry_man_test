import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:laundryman/utils/theme/colors.dart';
import 'package:laundryman/utils/theme/text_themes.dart';
import 'package:laundryman/viewmodels/home_viewmodel.dart';

class IntroSearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const IntroSearchWidget({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final customCardBoxDecoration = BoxDecoration(
      color: const Color(0xeff18202E),
      borderRadius: BorderRadius.circular(
        8.vdp(),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(
        top: 2.vdp(),
        bottom: 16.hdp(),
      ),
      child: Container(
        height: 210.vdp(),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 16.vdp(),
          horizontal: 16.hdp(),
        ),
        decoration: customCardBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Ratul 👋",
              style: AppTextThemes().bodyText1.copyWith(
                    color: const Color(0xeffD1D3D4),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              "What you are looking for today",
              maxLines: 2,
              style: AppTextThemes().bodyText1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp(),
                  ),
            ),
            const VSpace(10),
            TextField(
              style: AppTextThemes().bodyText2.copyWith(
                    color: Colors.white,
                  ),
              controller: Get.find<HomeViewModel>().searchEditingController,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(9.vdp()),
                    width: 32.vdp(),
                    height: 32.vdp(),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 16.vdp(),
                    ),
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(10.vdp()),
                fillColor: const Color(0xff18202E),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.vdp())),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.vdp(),
                    )),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: AppTextThemes()
                    .bodyText2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                labelText: "Search what you need...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
