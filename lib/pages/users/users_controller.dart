import 'package:dio/dio.dart';
import 'package:ebutler_task/base/controllers/pref/pref_controller.dart';
import 'package:ebutler_task/base/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class UsersController extends gt.GetxController with WidgetsBindingObserver {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();
  PrefController prefController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  int pages = 1;
  int limit = 10;
  int pageLimit = 10;
  List<UserModel> userModelList = [];
  bool isLoadMore = false;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    logController.red(msg: 'init Users controller');
    onLoadUsers(isLoading: true);
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Users controller');
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    logController.red(msg: 'close Users controller');
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logController.blue(msg: 'state = $state');
    if (state != AppLifecycleState.resumed) {
      var dateTime = DateTime.now();
      prefController.lastTimeActive = '$dateTime';
    }
    super.didChangeAppLifecycleState(state);
  }

//***************************************************************************************************************

//  methods

  void onLoadUsers({required bool isLoading}) async {
    if (isLoading) {
      appStatus = AppStatus.loading;
      update();
    }
    await apiController
        .onUsers(page: pages.toString(), limit: limit.toString())
        .then((response) {
      var list =
          List<UserModel>.from(response.data.map((i) => UserModel.fromJson(i)));
      userModelList.addAll(list);
      appStatus = AppStatus.success;
      isLoadMore = false;
      update();
    }).onError((DioError error, stackTrace) {
      appStatus = AppStatus.failed;
      alertsController.onShowErrorSneakBar(text: error.response.toString());
      update();
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      appStatus = AppStatus.failed;
      alertsController.onShowErrorSneakBar();
      update();
    });
  }

  void onAddPress() {
    gt.Get.toNamed('/add_edit_user', parameters: {'isEdit': 'false'});
  }

  void onAddLocationPress() {
    gt.Get.toNamed('/add_location');
  }

  void onItemLongPress({required String email, required String image}) {
    gt.Get.toNamed('/add_edit_user',
        parameters: {'isEdit': 'true', 'email': email, 'image': image});
  }

  void onItemNormalPress({required UserModel model}) {
    gt.Get.toNamed('/user_details',arguments: model);
  }

  void onLoadMore() {
    if (pages < pageLimit) {
      isLoadMore = true;
      update();
      pages = pages + 1;
      onLoadUsers(isLoading: false);
    }
  }
}
