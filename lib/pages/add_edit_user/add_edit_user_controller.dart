import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/media/media_controller.dart';
import 'package:ebutler_task/pages/add_edit_user/widgets/add_edit_img_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:image_picker/image_picker.dart';
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class AddEditUserController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();
  MediaController mediaController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  bool isEdit = false;

  TextEditingController emailController = TextEditingController();

  bool get isValidEmail => utilsController.isEmail(email: emailController.text);

  bool isAssetsSelected = false;
  String oldNetworkImg = '';
  File? newAssetsImage;

  final formKey = GlobalKey<FormState>();

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Add User controller');
    String isEditStr = gt.Get.parameters['isEdit']!;
    isEdit = isEditStr == 'true';
    if (isEdit) {
      emailController.text = gt.Get.parameters['email']!;
      oldNetworkImg = gt.Get.parameters['image']!;
    }
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Add User controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Add User controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onBackPress() {
    gt.Get.back();
  }

  void onSubmitPress() {
    if (formKey.currentState!.validate()) {
      utilsController.clearFocus();
      appStatus = AppStatus.loading;
      update();
      isEdit ? _editUser() : _addUser();
    }
  }

  void onAddProfilePicPress() {
    alertsController.onShowCustomDialog(
        widget: AddEditUserImgDialog(
          controller: this,
        ),
        backgroundColor: AppColors.colorWhite1,
        borderRadius: 20);
  }

  void onChooseImagePress(ImageSource source) {
    gt.Get.back();
    mediaController.onPickImage(type: source).then((value) {
      if (value != null) {
        isAssetsSelected = true;
        newAssetsImage = value;
        update();
      }
    });
  }

  _editUser() async {
    await apiController.onEditUser().then((response) {
      appStatus = AppStatus.success;
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

  _addUser() async {
    await apiController.onAddUser().then((response) {
      appStatus = AppStatus.success;
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


}
