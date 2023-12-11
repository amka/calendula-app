import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppstateService extends GetxService {
  final activePageIndex = 0.obs;
  final pageController = Rx<PageController?>(null);

  AppstateService() {
    pageController.value = PageController(initialPage: activePageIndex.value);
  }

  void setActivePage(int index) {
    activePageIndex.value = index;
    pageController.value!.jumpToPage(index);
  }
}
