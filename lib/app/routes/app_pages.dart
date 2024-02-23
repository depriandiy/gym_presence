import 'package:get/get.dart';

import '../modules/add_member/bindings/add_member_binding.dart';
import '../modules/add_member/views/add_member_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/members/bindings/members_binding.dart';
import '../modules/members/views/members_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MEMBERS,
      page: () => const MembersView(),
      binding: MembersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEMBER,
      page: () => AddMemberView(),
      binding: AddMemberBinding(),
    ),
  ];
}
