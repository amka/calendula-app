import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppstateController extends GetxController {
  final pageIndex = 0.obs;
  final sidebarOpen = false.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPageIndex(int index) => pageIndex.value = index;

  void toggleSidebar() => sidebarOpen.value = !sidebarOpen.value;
}
