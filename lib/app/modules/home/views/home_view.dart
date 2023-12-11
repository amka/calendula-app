import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/device_info.dart';
import '../../../modules/calendar/controllers/calendar_controller.dart';
import '../../../modules/calendar/views/calendar_view.dart';
import '../../../modules/upcoming/controllers/upcoming_controller.dart';
import '../../../widgets/bottom_bar.dart';
import '../../../widgets/sidebar.dart';
import '../../members/controllers/members_controller.dart';
import '../../members/views/members_view.dart';
import '../../organization/controllers/organization_controller.dart';
import '../../organization/views/organization_view.dart';
import '../../upcoming/views/upcoming_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      //   leading: IconButton(
      //     onPressed: controller.signOut,
      //     icon: const Icon(TablerIcons.door_exit),
      //   ),
      // ),
      body: SafeArea(
        child: Row(
          children: [
            DeviceScreen.isMonitor(context) || DeviceScreen.isTablet(context)
                ? Sidebar()
                : const SizedBox.shrink(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      children: [
                        GetBuilder(
                          init: UpcomingController(),
                          builder: (context) => const UpcomingView(),
                        ),
                        GetBuilder(
                          init: CalendarController(),
                          builder: (context) => const CalendarView(),
                        ),
                        GetBuilder(
                          init: MembersController(),
                          builder: (context) => const MembersView(),
                        ),
                        GetBuilder(
                          init: OrganizationController(),
                          builder: (context) => const OrganizationView(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          !DeviceScreen.isMonitor(context) && !DeviceScreen.isTablet(context)
              ? BottomBar()
              : null,
    );
  }
}
