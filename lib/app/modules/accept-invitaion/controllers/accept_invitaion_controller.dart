import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import '../../../data/services/team.dart';
import '../../../routes/app_pages.dart';

class AcceptInvitaionController extends GetxController {
  final TeamService teamService = Get.find();

  final loading = false.obs;

  bool get acceptanceValid =>
      Get.parameters['teamId'] != null &&
      Get.parameters['membershipId'] != null &&
      Get.parameters['userId'] != null &&
      Get.parameters['secret'] != null;

  void onAcceptInvitation() async {
    if (!acceptanceValid) return;

    try {
      loading.value = true;

      await teamService.updateMembershipStatus(
          teamId: Get.parameters['teamId']!,
          membershipId: Get.parameters['membershipId']!,
          userId: Get.parameters['userId']!,
          secret: Get.parameters['secret']!);

      await teamService.fetchTeams();

      Get.offAllNamed(Routes.HOME);
    } finally {
      loading.value = true;
    }
  }
}
