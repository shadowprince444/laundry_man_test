import 'package:flutter/material.dart';
import 'package:laundryman/utils/screen_utils/size_config.dart';

import '../enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  double deviceWidth = mediaQueryData.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  } else if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  } else {
    return DeviceScreenType.Mobile;
  }
}

OutlineInputBorder searchInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    1.5.vdp(),
  ),
  borderSide: BorderSide(
    width: 0.vdp(),
    color: Colors.transparent,
  ),
);
double getScaledImageHeight(
    double imageHeight, double imageWidth, double maxWidth) {
  return (imageHeight * maxWidth) / imageWidth;
}
