import 'package:ebutler_task/pages/add_edit_user/add_edit_user_view.dart';
import 'package:ebutler_task/pages/add_location/add_location_view.dart';
import 'package:ebutler_task/pages/auth/auth_view.dart';
import 'package:ebutler_task/pages/user_details/user_details_view.dart';
import 'package:ebutler_task/pages/users/users_view.dart';
import 'package:get/get.dart';


class NavigationController {
  static List<GetPage<dynamic>> getRouters() {
    return [
      GetPage(name: "/auth", page: () => AuthView()),
      GetPage(name: "/users", page: () => UsersView()),
      GetPage(name: "/add_edit_user", page: () => AddEditUserView()),
      GetPage(name: "/add_location", page: () => AddLocationView()),
      GetPage(name: "/user_details", page: () => UserDetailsView()),
    ];
  }
}
