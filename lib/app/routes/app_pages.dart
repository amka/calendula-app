import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/members/bindings/members_binding.dart';
import '../modules/members/views/members_view.dart';
import '../modules/organization/bindings/organization_binding.dart';
import '../modules/organization/views/organization_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/teams-create/bindings/teams_create_binding.dart';
import '../modules/teams-create/views/teams_create_view.dart';
import '../modules/teams/bindings/teams_binding.dart';
import '../modules/teams/views/teams_view.dart';
import '../modules/upcoming/bindings/upcoming_binding.dart';
import '../modules/upcoming/views/upcoming_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.MEMBERS,
      page: () => const MembersView(),
      binding: MembersBinding(),
    ),
    GetPage(
      name: _Paths.ORGANIZATION,
      page: () => const OrganizationView(),
      binding: OrganizationBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING,
      page: () => const UpcomingView(),
      binding: UpcomingBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.TEAMS,
      page: () => const TeamsView(),
      binding: TeamsBinding(),
    ),
    GetPage(
      name: _Paths.TEAMS_CREATE,
      page: () => const TeamsCreateView(),
      binding: TeamsCreateBinding(),
    ),
  ];
}
