import 'package:appwrite/models.dart';
import 'package:calendula/app/controllers/appstate_controller.dart';
import 'package:get/get.dart';

import '../../data/services/auth.dart';
import '../../routes/app_pages.dart';

class SidebarController extends GetxController {
  final AuthService authService = Get.find();
  final AppstateController appState = Get.find();

  Rx<User?> get user => authService.user;

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

  Future signOut() async {
    await authService.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }
}
