import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import 'controller.dart';

class Sidebar extends GetView<SidebarController> {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  'Calendula',
                  style: GoogleFonts.ibmPlexSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          const Divider(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.PROFILE),
                child: const Text('Profile'),
              ),
            ),
          ),
          // controller.user.value != null
          //     ? Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: Text(
          //           controller.user.value!.email,
          //           style: Theme.of(context).textTheme.bodyMedium,
          //         ),
          //     )
          //     : const SizedBox.shrink(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: controller.signOut,
                child: const Text('Sign Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
