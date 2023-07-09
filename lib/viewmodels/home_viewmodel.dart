import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryman/utils/theme/assets.dart';
import '../models/home_screen_offers.dart';
import '../services/firebase_service.dart';

class HomeViewModel extends GetxController {
  final FirebaseService _firebaseService;
  final TextEditingController searchEditingController = TextEditingController();
  String selectedNavTab = homeIcon;
  HomeViewModel(this._firebaseService);
  List<HomeScreenOffersModel> laundryData = [
    HomeScreenOffersModel(title: 'Free Detergent', offerPercentage: 100),
    HomeScreenOffersModel(title: '50% off Dry Cleaning', offerPercentage: 50),
    HomeScreenOffersModel(title: '3 for 2 Socks', offerPercentage: 33.33),
    HomeScreenOffersModel(title: '20% off Bedding', offerPercentage: 20),
    HomeScreenOffersModel(
        title: '15% off Ironing Services', offerPercentage: 15),
    HomeScreenOffersModel(title: '10% off Stain Removal', offerPercentage: 10),
    HomeScreenOffersModel(title: 'First Wash Free', offerPercentage: 100),
  ];
  updateSelectedNavTab(String tab) {
    selectedNavTab = tab;
    update();
  }

  void signOut() async {
    await _firebaseService.signOut();
    Get.offAllNamed('/');
  }
}
