import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeController {

  //dark
  void darkMode() => Get.changeTheme(ThemeData.dark());

  //light
  void lightMode() => Get.changeTheme(ThemeData.light());

  //change from dark to light & light to dark
  void switchDarkLight() => Get.isDarkMode ? lightMode() : darkMode();

  //custom theme
  void customTheme({required ThemeData theme}) => Get.changeTheme(theme);

}