import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController {

  void updateLocale({required String locale}) =>
      Get.updateLocale(Locale(locale));

  Locale? getDeviceLocale() => Get.deviceLocale;

  Locale? getCurrentLocale() => Get.locale;
}
