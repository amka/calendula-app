import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/leaves_controller.dart';

class LeavesView extends GetView<LeavesController> {
  const LeavesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeavesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LeavesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
