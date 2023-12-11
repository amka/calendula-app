import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../widgets/entry.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/teams_create_controller.dart';

class TeamsCreateView extends GetView<TeamsCreateController> {
  const TeamsCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TeamsCreateView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 16),
                      child: GradientText('Create team'.tr,
                          style: const TextStyle(fontSize: 48),
                          colors: [
                            Colors.deepPurple.shade700,
                            Colors.teal.shade700,
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Text(
                        'Enter team name. You can change it later.'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Entry(
                          label: 'Team name'.tr,
                          autofocus: true,
                          enabled: !controller.loading.value,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Team requires a name'.tr;
                            }
                            return null;
                          },
                          controller: controller.nameCtrl,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: !controller.loading.value
                            ? () => controller.onCreateTeam()
                            : null,
                        label: 'Confirm'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
