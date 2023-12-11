import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/entry.dart';

class CreateMemberForm extends StatelessWidget {
  const CreateMemberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Entry(
              controller: TextEditingController(),
              label: 'First Name'.tr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Entry(
              controller: TextEditingController(),
              label: 'Last Name'.tr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Entry(
              controller: TextEditingController(),
              label: 'Email Address'.tr,
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: PrimaryButton(
          //     label: 'Save member'.tr,
          //     onPressed: () => Get.back(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
