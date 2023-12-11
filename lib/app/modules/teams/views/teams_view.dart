import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/teams_controller.dart';

class TeamsView extends GetView<TeamsController> {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
