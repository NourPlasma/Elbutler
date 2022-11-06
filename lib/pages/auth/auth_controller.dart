import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/base/controllers/pref/pref_controller.dart';
import 'package:ebutler_task/base/controllers/sql/sql_controller.dart';
import 'package:ebutler_task/base/models/user_sql_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class AuthController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  SqlController sqlController = gt.Get.find();
  PrefController prefController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  bool get isValidEmail => utilsController.isEmail(email: emailController.text);

  TextEditingController passwordController = TextEditingController();

  bool get isValidPassword => passwordController.text.length >= 6;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Auth controller');
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Auth controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Auth controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  onLoginPress() async {
    if (formKey.currentState!.validate()) {
      utilsController.clearFocus();
      appStatus = AppStatus.loading;
      update();
      var allEmails = await sqlController.loadAll();
      var found = false;
      for (var element in allEmails) {
        found = element.email == emailController.text;
      }
      found ? _login() : _register();
    }
  }

  _login() {
    prefController.isLogin = true;
    appStatus = AppStatus.success;
    update();
    alertsController.onShowSuccessSneakBar(text: AppLocalKeys.loginSuccess.tr);
    gt.Get.offNamed('/users');
  }

  _register() async {
    await sqlController.insert(UserSqlModel(email: emailController.text));
    _login();
  }

}
