import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/appstate_controller.dart';
import '../../../widgets/sidebar/sidebar.dart';
import '../../calendar/controllers/calendar_controller.dart';
import '../../calendar/views/calendar_view.dart';
import '../../members/controllers/members_controller.dart';
import '../../members/views/members_view.dart';
import '../../upcoming/controllers/upcoming_controller.dart';
import '../../upcoming/views/upcoming_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AppstateController appState = Get.find();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: appState.pageIndex.value,
          children: [
            GetBuilder(
              init: UpcomingController(),
              builder: (GetxController controller) {
                return const UpcomingView();
              },
            ),
            GetBuilder(
              init: CalendarController(),
              builder: (GetxController controller) {
                return const CalendarView();
              },
            ),
            GetBuilder(
              init: MembersController(),
              builder: (GetxController controller) {
                return MembersView();
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: appState.pageIndex.value,
          onTap: appState.setPageIndex,
          backgroundColor: Theme.of(context).colorScheme.background,
          items: const [
            BottomNavigationBarItem(
              label: 'Upcoming',
              icon: Icon(Icons.access_alarm),
            ),
            BottomNavigationBarItem(
              label: 'Calendar',
              icon: Icon(Icons.calendar_month),
            ),
            BottomNavigationBarItem(
              label: 'Members',
              icon: Icon(Icons.people_alt_outlined),
            ),
          ],
        ),
      ),
      drawer: const Sidebar(),
    );
  }
}

/// An intent that is bound to SelectAllAction to select all the text in its
/// controller.
class AddMemberIntent extends Intent {
  const AddMemberIntent();
}

/// An action that is bound to SelectAllAction that selects all text in its
/// TextEditingController.
class AddMemberAction extends Action<AddMemberIntent> {
  AddMemberAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant AddMemberIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );

    return null;
  }
}