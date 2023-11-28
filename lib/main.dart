import 'package:calendula/app/data/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/providers/appwrite.dart';
import 'app/routes/app_pages.dart';

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
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
          buttonTheme: const ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          textTheme: GoogleFonts.interTextTheme()),
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

  Get.lazyPut(() => AuthService(provider: provider));
}
