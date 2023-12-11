import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/team.dart';

class MembersController extends GetxController {
  final TeamService teamService = Get.find();

  final perPage = 10.obs;
  final currentPage = 0.obs;
  final loading = false.obs;

  Future<List<Membership>> getMembers() async {
    try {
      loading.value = true;
      return await teamService.listMembers(
        teamId: teamService.currentTeam.value!.$id,
        perPage: perPage.value,
        currentPage: currentPage.value,
      );
    } catch (e) {
      EasyLoading.showError('Failed to fetch members'.tr);
    } finally {
      loading.value = true;
    }
    return [];
  }

  void changePage(int page) {
    currentPage.value = page;
    getMembers();
  }
}
