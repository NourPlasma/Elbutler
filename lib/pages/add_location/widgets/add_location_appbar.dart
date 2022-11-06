import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/add_location/add_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_const/const.dart';
import '../../../base/controllers/local/local_translations.dart';


class AddLocationAppbar extends StatelessWidget {
  final AddLocationController controller;
  const AddLocationAppbar({Key? key,required this.controller}) : super(key: key);

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
          Text(AppLocalKeys.addLocation.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.colorBlack1,
                  fontSize: 50,
                  fontFamily: AppConst.shalimarFamily)),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBlack1,
            ),
            onPressed: controller.onAddPress,
            child: Text(
              AppLocalKeys.add.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.colorWhite1),
            ),
          )

        ],
      ),
    );
  }
}
