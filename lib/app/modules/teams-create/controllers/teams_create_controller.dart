import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/team.dart';
import '../../../routes/app_pages.dart';

class TeamsCreateController extends GetxController {
  final TeamService teamService = Get.find();

  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final loading = false.obs;

  @override
  void onClose() {
    nameCtrl.dispose();
    super.onClose();
  }

  void onCreateTeam() async {
    if (formKey.currentState!.validate()) {
      try {
        loading.value = true;
        await teamService.createTeam(name: nameCtrl.text.trim());
        Get.offAllNamed(Routes.HOME);
      } on AppwriteException catch (e) {
        EasyLoading.showError(e.message.toString());
      } finally {
        loading.value = false;
      }
    }
  }
}
