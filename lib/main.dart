import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/appwrite_provider.dart';
import 'app/data/services/appstate.dart';
import 'app/data/services/auth.dart';
import 'app/data/services/team.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/dark.dart';
import 'app/themes/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "Calendula",
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
      onInit: () {
        // Check if the user was authenticated
        Get.find<AuthService>().loadUser().then((user) {
          if (user != null) {
            Get.find<TeamService>().fetchTeams();
          } else {
            // If the user was not authenticated
            // And trying to get private routes
            // Then redirect to sign in page.
            if (Get.currentRoute.startsWith(Routes.ACCEPT_INVITAION) ||
                Get.currentRoute.startsWith(Routes.SIGNIN) ||
                Get.currentRoute.startsWith(Routes.SIGNUP)) {
              return;
            }
            Get.offAllNamed(Routes.SIGNIN);
          }
        });
      },
      onUnknownRoute: (RouteSettings routeSettings) {
        log(routeSettings.toString());
        return null;
      },
    ),
  );
}

initServices() async {
  final provider = AppwriteProvider(
    baseUrl: "https://cloud.appwrite.io/v1",
    projectId: "calendula",
    locale: (Get.locale ?? 'en-US').toString(),
    selfSigned: !kReleaseMode,
  );

  Get.put(AppstateService());
  Get.put(AuthService(provider: provider));
  Get.put(TeamService(provider: provider));
}
