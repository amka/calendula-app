import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/members_controller.dart';

class MembersView extends GetView<MembersController> {
  const MembersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MembersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MembersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
