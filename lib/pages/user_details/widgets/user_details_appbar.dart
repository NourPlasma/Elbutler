import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_const/const.dart';

class UserDetailsAppbar extends StatelessWidget {
  final UserDetailsController controller;
  const UserDetailsAppbar({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 5),
      child: Row(
        children: [
          IconButton(
              onPressed: controller.onBackPress,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.colorBlack1,
              )),
          Text(AppLocalKeys.userDetails.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.colorBlack1,
                  fontSize: 50,
                  fontFamily: AppConst.shalimarFamily)),
        ],
      ),
    );
  }
}
