import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/device_info.dart';
import '../data/services/appstate.dart';
import '../data/services/auth.dart';
import '../data/services/team.dart';
import 'avatar.dart';

class HeaderBar extends StatelessWidget {
  final AuthService authService = Get.find();
  final TeamService teamService = Get.find();
  final AppstateService appstate = Get.find();

  final String title;
  final List<Widget>? trailing;

  HeaderBar({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        !DeviceScreen.isTablet(context) && !DeviceScreen.isMonitor(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.secondary.withAlpha(75),
          ),
        ),
      ),
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              if (isSmallScreen)
                const Hero(
                  tag: 'profile-avatar',
                  child: Avatar(),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              const Spacer(),
              ...(trailing ?? []),
            ],
          ),
        ),
      ),
    );
  }
}
