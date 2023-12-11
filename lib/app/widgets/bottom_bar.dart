import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../data/services/appstate.dart';
import '../data/services/auth.dart';
import '../data/services/team.dart';
import '../routes/app_pages.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final AuthService authService = Get.find();
  final TeamService teamService = Get.find();
  final AppstateService appstate = Get.find();

  BottomBar({super.key, this.selectedIndex = 0});

  Future<void> onSignOut() async {
    await authService.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }

  @override
  Widget build(BuildContext context) {
    final unselectedColor =
        Theme.of(context).colorScheme.onBackground.withAlpha(190);
    final selectedColor = Theme.of(context).colorScheme.primary;

    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: unselectedColor,
        selectedItemColor: selectedColor,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        onTap: appstate.setActivePage,
        currentIndex: appstate.activePageIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(TablerIcons.dashboard),
            label: 'Dashboard'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(TablerIcons.calendar),
            label: 'Calendar'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(TablerIcons.users),
            label: 'Members'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(TablerIcons.building),
            label: 'Organization'.tr,
          ),
        ],
      ),
    );
  }
}
