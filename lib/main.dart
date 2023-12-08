import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/controllers/appstate_controller.dart';
import 'app/data/providers/appwrite.dart';
import 'app/data/services/auth.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/sidebar/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange.shade700,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
          buttonTheme: const ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          textTheme: GoogleFonts.notoSansTextTheme()),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future initServices() async {
  await GetStorage.init();

  const apiUrl = String.fromEnvironment('API_URL');

  final provider = AppWriteProvider(
    endpoint: apiUrl,
    selfSigned: kDebugMode,
    locale: Get.deviceLocale?.languageCode ?? 'en-Us',
  );

  Get.put(AppstateController());
  Get.put(AuthService(provider: provider));
  Get.put(SidebarController());
}
