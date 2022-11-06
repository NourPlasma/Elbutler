import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_widgets/app_loading.dart';

class AlertsController {
  //Show Get SnackBar
  void showGetSnackBar({
    String title = '',
    String message = '',
    Widget? messageText,
    Widget? titleText,
    Widget? icon,
    double margin = 10,
    int duration = 1500,
    bool noMsg = true,
    double barBlur = 7,
    double overlayBlur = 0,
    double borderRadius = 15,
    SnackPosition position = SnackPosition.BOTTOM,
    Color colorText = Colors.black,
    Color? backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      messageText: noMsg ? Container() : messageText,
      margin: EdgeInsets.all(margin),
      duration: Duration(milliseconds: duration),
      snackPosition: position,
      icon: icon,
      titleText: titleText,
      barBlur: barBlur,
      overlayBlur: overlayBlur,
      borderRadius: borderRadius,
      colorText: colorText,
      backgroundColor: backgroundColor,
    );
  }

  //Show Success SneakBar
  onShowSuccessSneakBar({String? text}) {
    showGetSnackBar(
        title: text ?? AppLocalKeys.success.tr,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: AppColors.colorWhite1,
        icon: const Icon(
          Icons.check_circle_rounded,
          color: AppColors.colorWhite1,
          size: 25,
        ),
        barBlur: 3);
  }

  //Show Notification SneakBar
  onShowNotificationSneakBar({required String text, required String des}) {
    showGetSnackBar(
        duration: 2000,
        message: des,
        messageText: Text(
          des,
          style: const TextStyle(
              color: AppColors.colorWhite1,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        noMsg: false,
        title: text,
        position: SnackPosition.TOP,
        backgroundColor: Colors.orange.withOpacity(0.8),
        colorText: AppColors.colorWhite1,
        icon: const Icon(
          Icons.notifications_active_rounded,
          color: AppColors.colorWhite1,
          size: 25,
        ),
        barBlur: 3);
  }
  //Show Error SneakBar
  onShowErrorSneakBar({String? text}) {
    showGetSnackBar(
        title: text ?? AppLocalKeys.error.tr,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: AppColors.colorWhite1,
        icon: const Icon(
          Icons.cancel_rounded,
          color: AppColors.colorWhite1,
          size: 25,
        ),
        barBlur: 3);
  }

  // Show Loading Dialog
  onShowLoadingDialog({String? text, bool noBack = true}) {
    onShowCustomDialog(
        widget: AppLoadingWidget(
          withText: true,
          text: text ?? AppLocalKeys.loading.tr,
        ),
        noBack: noBack,
        backgroundColor: AppColors.colorWhite1,
        borderRadius: 20);
  }

  //Show Normal SnackBar
  void onShowSnackBar(
      {required BuildContext context, required String message,SnackBarAction? action}) {
    var snackBar = SnackBar(content: Text(message),action: action,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Show Custom Dialog
  void onShowCustomDialog({
    double borderRadius = 0,
    Color? backgroundColor,
    required Widget widget,
    bool noBack = false,
  }) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        onWillPop: noBack ? _onWillPop : null,
        content: widget,
        title: '',
        backgroundColor: backgroundColor,
        radius: borderRadius);
  }

  //remove back action from dialog
  Future<bool> _onWillPop() async {
    return false;
  }

  //Show Bottom Sheet Dialog
  void onShowBottomSheet({
    required Widget widget,
    double elevation = 0,
    bool enableDrag = true,
    bool ignoreSafeArea = false,
    bool isDismissible = true,
  }) {
    Get.bottomSheet(
      widget,
      isDismissible: isDismissible,
      isScrollControlled: true,
      ignoreSafeArea: ignoreSafeArea,
      enableDrag: enableDrag,
      elevation: elevation,
    );
  }

  //Show Alert Dialog
  void onShowAlertDialog({
    required Color backgroundColor,
    double borderRadius = 0,
    required Color cancelTextColor,
    required Color confirmTextColor,
    required Color confirmButtonColor,
    String title = '',
    String message = '',
    required Function() onCancel,
    required Function() onConfirm,
    required String textCancel,
    required String textConfirm,
  }) {
    Get.defaultDialog(
      radius: borderRadius,
      buttonColor: confirmButtonColor,
      backgroundColor: backgroundColor,
      title: title,
      middleText: message,
      onCancel: onCancel,
      onConfirm: onConfirm,
      cancelTextColor: cancelTextColor,
      confirmTextColor: confirmTextColor,
      textCancel: textCancel,
      textConfirm: textConfirm,
    );
  }


  onShowNormalDialog({required EdgeInsets padding,required BuildContext context,required Widget child}){
    showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: padding,
        child: child,
      );
    });
  }
}
