import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/header_bar.dart';
import '../controllers/organization_controller.dart';

class OrganizationView extends GetView<OrganizationController> {
  const OrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderBar(title: 'Organization'.tr),
            const Expanded(
              child: Center(
                child: Text(
                  'Organization is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
