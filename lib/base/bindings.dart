import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:ebutler_task/pages/add_location/add_location_controller.dart';
import 'package:ebutler_task/pages/auth/auth_controller.dart';
import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:get/get.dart';
import 'controllers/alerts/alerts_controller.dart';
import 'controllers/local/localization_controller.dart';
import 'controllers/log/log_controller.dart';
import 'controllers/media/media_controller.dart';
import 'controllers/network/api_controller.dart';
import 'controllers/pref/pref_controller.dart';
import 'controllers/sql/sql_controller.dart';
import 'controllers/utils/utils_controller.dart';


class MainBindings implements Bindings {
  @override
  void dependencies() {

    //Services
    Get.put(ApiController(),permanent: true);
    Get.put(SqlController(),permanent: true);
    Get.lazyPut(() => PrefController(), fenix: true);
    Get.lazyPut(() => LocalizationController(), fenix: true);
    Get.lazyPut(() => LogController(), fenix: true);
    Get.lazyPut(() => UtilsController(), fenix: true);
    Get.lazyPut(() => AlertsController(), fenix: true);
    Get.lazyPut(() => MediaController(), fenix: true);

    //View
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UsersController(), fenix: true);
    Get.lazyPut(() => AddEditUserController(), fenix: true);
    Get.lazyPut(() => AddLocationController(), fenix: true);
    Get.lazyPut(() => UserDetailsController(), fenix: true);

  }
}
