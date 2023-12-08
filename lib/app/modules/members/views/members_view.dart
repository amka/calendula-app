import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../controllers/members_controller.dart';
import '../widgets/add_member_dialog.dart';

class MembersView extends GetView<MembersController> {
  const MembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MembersView'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(TablerIcons.menu),
          ),
        ),
        body: const Center(
          child: Text(
            'MembersView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'MembersFAB',
          onPressed: () {
            Get.to(
              () => AddMemberDialog(),
              transition: Transition.downToUp,
              duration: Durations.short3,
            );
          },
          child: const Icon(TablerIcons.plus),
        ),
    );
  }
}