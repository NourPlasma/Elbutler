
import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_const/const.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class AuthText extends StatelessWidget {
   const AuthText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalKeys.welcome.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.colorBlack1,
            fontSize: 100,
            fontFamily: AppConst.shalimarFamily));
  }
}
