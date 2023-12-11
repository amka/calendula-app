import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/appstate.dart';
import '../../../data/services/auth.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final AuthService authService;
  final AppstateService appstateService;
  get pageController => appstateService.pageController.value;

  HomeController({required this.authService, required this.appstateService});

  void signOut() async {
    EasyLoading.showToast('T_T');
    await authService.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }
}
