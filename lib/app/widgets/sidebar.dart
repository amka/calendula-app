import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../data/services/appstate.dart';
import '../data/services/auth.dart';
import '../data/services/team.dart';
import '../routes/app_pages.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final AuthService authService = Get.find();
  final TeamService teamService = Get.find();
  final AppstateService appstate = Get.find();

  Sidebar({super.key, this.selectedIndex = 0});

  Future<void> onSignOut() async {
    await authService.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }

  @override
  Widget build(BuildContext context) {
    final expanded = MediaQuery.of(context).size.width > 600;
    final controller = SidebarXController(
      selectedIndex: appstate.activePageIndex.value,
      extended: expanded,
    );
    // controller.setExtended(expanded);

    return SidebarX(
      controller: controller,
      extendIcon: TablerIcons.chevron_right,
      collapseIcon: TablerIcons.chevron_left,
      theme: SidebarXTheme(
        itemMargin: const EdgeInsets.symmetric(horizontal: 8),
        selectedItemMargin: const EdgeInsets.symmetric(horizontal: 8),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary.withAlpha(45),
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.secondary.withAlpha(75),
            ),
          ),
        ),
      ),
      extendedTheme: SidebarXTheme(
          width: 240,
          itemTextPadding: const EdgeInsets.only(left: 8),
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          selectedItemTextPadding: const EdgeInsets.only(left: 8),
          selectedTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          hoverTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          )),
      animationDuration: Durations.short2,
      headerBuilder: (context, expanded) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Obx(
          () => Column(
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 24,
                ),
              ),
              teamService.currentTeam.value != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        teamService.currentTeam.value!.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      items: [
        SidebarXItem(
          icon: TablerIcons.dashboard,
          label: 'Dashboard'.tr,
          onTap: () => appstate.setActivePage(0),
        ),
        SidebarXItem(
          icon: TablerIcons.calendar,
          label: 'Calendar'.tr,
          onTap: () => appstate.setActivePage(1),
        ),
        SidebarXItem(
          icon: TablerIcons.users_group,
          label: 'Members'.tr,
          onTap: () => appstate.setActivePage(2),
        ),
        SidebarXItem(
          icon: TablerIcons.building,
          label: 'Organization'.tr,
          onTap: () => appstate.setActivePage(3),
        ),
      ],
      footerItems: [
        SidebarXItem(
          icon: TablerIcons.door_exit,
          label: 'Sign out'.tr,
          onTap: onSignOut,
        ),
      ],
      toggleButtonBuilder: (context, expanded) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            expanded
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Collapse'.tr,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            IconButton(
              onPressed: () {
                controller.setExtended(!controller.extended);
              },
              icon: Icon(
                expanded ? TablerIcons.chevron_left : TablerIcons.chevron_right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
