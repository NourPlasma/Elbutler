import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_const/const.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddEditUserAppbar extends StatelessWidget {
  final AddEditUserController controller;
  const AddEditUserAppbar({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 5),
      child: Row(
        children: [
          IconButton(
              onPressed: controller.onBackPress,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.colorBlack1,
              )),
          Text(controller.isEdit ? AppLocalKeys.editUser.tr : AppLocalKeys.addUser.tr,
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
