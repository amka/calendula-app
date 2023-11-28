import 'dart:developer';

import 'package:calendula/app/data/services/auth.dart';
import 'package:calendula/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService authService = Get.find();

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    loading.value = true;
    authService.loadUser().then((value) {
      log('AuthService initialized: ${authService.status.value}');
      authService.status.value == AuthStatus.authenticated
          ? Get.offAllNamed(Routes.HOME)
          : Get.offAllNamed(Routes.SIGNIN);
      loading.value = false;
    }).catchError((err) {
      log('Error occured: $err');
      loading.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
