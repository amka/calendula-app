import 'package:calendula/app/data/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/providers/appwrite.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "Application",
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
