import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewControllerGetx extends GetxController {
  RxInt indexPageView = 0.obs;
  PageController pageController = PageController();

  void changePageView(int index) {
    indexPageView.value = index;
    pageController.jumpToPage(index);
  }

  void changeIndex(int index) {
    indexPageView.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
