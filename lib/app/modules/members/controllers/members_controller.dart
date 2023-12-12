import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/team.dart';
import '../models/member.dart';

class MembersController extends GetxController {
  final TeamService teamService = Get.find();

  final perPage = 10.obs;
  final currentPage = 0.obs;
  final loading = false.obs;

  final members = <Membership>[].obs;

  Future<List<Membership>> getMembers({bool force=false}) async {
    if (!force && members.isNotEmpty) {
      return members;
    }

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

  Future<Membership> inviteMember(Member member) async {
    return await teamService.inviteMember(
      teamId: teamService.currentTeam.value!.$id,
      email: member.email,
      roles: member.roles ?? ['MEMBER'],
    );
  }
}
