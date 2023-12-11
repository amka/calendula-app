import 'package:get/get.dart';

import '../controllers/teams_create_controller.dart';

class TeamsCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamsCreateController>(
      () => TeamsCreateController(),
    );
  }
}
