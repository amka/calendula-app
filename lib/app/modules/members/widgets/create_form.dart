import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/entry.dart';
import '../../../widgets/primary_button.dart';
import '../models/member.dart';

class CreateMemberForm extends StatelessWidget {
  CreateMemberForm({super.key});

  final formKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Entry(
                controller: emailCtrl,
                label: 'Email Address'.tr,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required'.tr;
                  }
                  if (!value.trim().isEmail) {
                    return 'Valid email is required'.tr;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Entry(
                controller: firstNameCtrl,
                label: 'First Name'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Entry(
                controller: lastNameCtrl,
                label: 'Last Name'.tr,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: 'Save member'.tr,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final member = Member(
                      email: emailCtrl.text.trim(),
                      firstName: firstNameCtrl.text.trim(),
                      lastName: lastNameCtrl.text.trim(),
                    );
                    Get.back(result: member);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
