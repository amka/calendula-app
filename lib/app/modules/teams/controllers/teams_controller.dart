import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/services/team.dart';
import '../../../routes/app_pages.dart';

class TeamsController extends GetxController {
  final TeamService teamService = Get.find();

  final fetched = false.obs;

  @override
  void onReady() {
    super.onReady();

    teamService.fetchTeams().then((value) {
      log('Fetched $value teams');

      fetched.value = true;
      // If the user has only 1 team - go to team directly
      // If no teams found - go to the team creation page
      switch (value) {
        case 0:
          Get.offAllNamed(Routes.TEAMS_CREATE);
          break;
        case 1:
          Get.offAllNamed(Routes.HOME);
          break;
        default:
          break;
      }
    });
  }
}
