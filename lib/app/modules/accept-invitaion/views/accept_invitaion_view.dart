import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/accept_invitaion_controller.dart';

class AcceptInvitaionView extends GetView<AcceptInvitaionController> {
  const AcceptInvitaionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientText(
                          "You've been invited!".tr,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            // color: Theme.of(context).colorScheme.onBackground,
                          ),
                          colors: [
                            Colors.deepPurple.shade700,
                            Colors.teal,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Text(
                            'Accept invite or sign into existing account'
                                .tr,
                            style: TextStyle(
                              color:
                              Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Obx(
                                () => PrimaryButton(
                                label: 'Accept'.tr,
                                onPressed: controller.loading.value
                                    ? null
                                    : controller.onAcceptInvitation),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? '.tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Get.offNamed(Routes.SIGNIN),
                        child: Text(
                          'Sign in here'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
