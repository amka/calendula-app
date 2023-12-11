import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voidtask/app/data/services/appstate.dart';
import 'package:voidtask/app/data/services/team.dart';

import 'app/data/appwrite_provider.dart';
import 'app/data/services/auth.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/dark.dart';
import 'app/themes/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "Void Tracker",
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      theme: ThemeData(
        colorScheme: lightScheme,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      // defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

initServices() async {
  final appwrite = AppwriteProvider(
    baseUrl: "https://cloud.appwrite.io/v1",
    projectId: "nanoplan",
    locale: Get.locale.toString(),
    selfSigned: !kReleaseMode,
  );

  Get.put(AppstateService());
  Get.put(AuthService(provider: appwrite));
  Get.put(TeamService(provider: appwrite));
}
