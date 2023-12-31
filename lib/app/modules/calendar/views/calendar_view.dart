import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/header_bar.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderBar(title: 'Calendar'.tr),
            const Expanded(
              child: Center(
                child: Text(
                  'Calendar is working',
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
