import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/header_bar.dart';
import '../controllers/upcoming_controller.dart';

class UpcomingView extends GetView<UpcomingController> {
  const UpcomingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderBar(title: 'Upcoming'.tr),
            const Expanded(
              child: Center(
                child: Text(
                  'UpcomingView is working',
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
