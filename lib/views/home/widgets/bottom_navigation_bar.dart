import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';
import 'package:laundryman/utils/theme/assets.dart';
import 'package:laundryman/viewmodels/home_viewmodel.dart';

class HomeScreenBottomNavigationBar extends StatelessWidget {
  const HomeScreenBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      homeIcon,
      documentIcon,
      notificationsIcon,
      profileIcon,
    ];
    return ColoredBox(
      color: Color(0xeff18202E),
      child: SizedBox(
          height: 72.vdp(),
          width: double.infinity,
          child: GetBuilder<HomeViewModel>(builder: (viewModel) {
            return Row(
              children: options
                  .map((option) => buildIcon(
                        option,
                        viewModel.updateSelectedNavTab,
                        viewModel.selectedNavTab,
                      ))
                  .toList(),
            );
          })),
    );
  }

  Widget buildIcon(String image, Function(String) onTap, String selectedIcon) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => onTap(image),
        child: Image.asset(
          image,
          color: selectedIcon == image ? Colors.white : Color(0xeff6F767E),
          height: 24.vdp(),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
