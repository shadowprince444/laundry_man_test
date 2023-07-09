import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/views/home/widgets/app_bar.dart';
import 'package:laundryman/views/home/widgets/bottom_navigation_bar.dart';
import 'package:laundryman/views/home/widgets/intro_search.dart';
import '../../utils/screen_utils/size_config.dart';
import '../../utils/screen_utils/widgets/responsive_safe_area.dart';
import '../../viewmodels/home_viewmodel.dart';
import 'widgets/categories.dart';
import 'widgets/cleaning_services.dart';
import 'widgets/laundary_offers.dart';

class HomeScreen extends GetWidget<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xeff0F1621),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          final customCardBoxDecoration = BoxDecoration(
            color: const Color(0xeff18202E),
            borderRadius: BorderRadius.circular(
              8.vdp(),
            ),
          );
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                const HomeScreenAppBar(),
                buildBody(customCardBoxDecoration),
                const HomeScreenBottomNavigationBar()
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded buildBody(BoxDecoration customCardBoxDecoration) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.vdp(),
          horizontal: 16.hdp(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntroSearchWidget(
                textEditingController: controller.searchEditingController,
              ),
              LaundryOfferWidget(controller: controller),
              const CategoriesWidget(),
              const CleaningServicesWidget()
            ],
          ),
        ),
      ),
    );
  }
}
