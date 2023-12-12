import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../../widgets/header_bar.dart';
import '../controllers/members_controller.dart';
import '../widgets/create_form.dart';
import '../widgets/member_list_tile.dart';

class MembersView extends GetView<MembersController> {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          HeaderBar(
            title: 'Members'.tr,
            trailing: [
              TextButton(
                child: const Row(
                  children: [
                    Icon(TablerIcons.user_plus),
                    SizedBox(width: 8),
                    Text('Add Member'),
                  ],
                ),
                onPressed: () => onAddMember(context),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.getMembers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return const Center(child: Text('Failed to fetch members'));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final member = snapshot.data![index];
                      return MemberListTile(member: member);
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }

  void onAddMember(context) async {
    final member = await Get.defaultDialog(
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 360),
        child: CreateMemberForm(),
      ),
      title: 'Add a member'.tr,
      titleStyle: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      titlePadding: const EdgeInsets.only(top: 16, bottom: 16),
      backgroundColor: Theme.of(context).colorScheme.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      radius: 10,
      // actions: [
      //   SizedBox(
      //     width: double.infinity,
      //     child: PrimaryButton(
      //       label: 'Save member'.tr,
      //       onPressed: () => Get.back(),
      //     ),
      //   ),
      // ],
    );

    if (member != null) {
      await controller.inviteMember(member);
      await controller.getMembers(force: true);
    }
  }
}
