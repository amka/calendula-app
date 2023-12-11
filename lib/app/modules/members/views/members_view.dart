import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../../widgets/header_bar.dart';
import '../../../widgets/primary_button.dart';
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
              ElevatedButton(
                child: const Row(
                  children: [
                    Icon(TablerIcons.user_plus),
                    SizedBox(width: 8),
                    Text('Add'),
                  ],
                ),
                onPressed: () async {
                  await Get.defaultDialog(
                      content: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 360),
                        child: const CreateMemberForm(),
                      ),
                      title: 'Add a member'.tr,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      radius: 10,
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            label: 'Save member'.tr,
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ]);
                },
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
}
