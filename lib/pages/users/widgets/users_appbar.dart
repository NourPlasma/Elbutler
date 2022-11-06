import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_const/const.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersAppbar extends StatelessWidget {
  final UsersController controller;
  const UsersAppbar({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 5),
      child: Row(
        children: [
          Text(AppLocalKeys.users.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.colorBlack1,
                  fontSize: 50,
                  fontFamily: AppConst.shalimarFamily)),
          const Spacer(),
          IconButton(
              onPressed: controller.onAddPress,
              icon: const Icon(
                Icons.add,
                color: AppColors.colorBlack1,
              ))
        ],
      ),
    );
  }
}
