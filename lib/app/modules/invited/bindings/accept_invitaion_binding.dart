import 'package:get/get.dart';

import '../controllers/accept_invitaion_controller.dart';

class AcceptInvitaionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcceptInvitaionController>(
      () => AcceptInvitaionController(),
    );
  }
}
