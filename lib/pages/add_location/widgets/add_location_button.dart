import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_location_controller.dart';


class AddLocationButton extends StatelessWidget {
  final AddLocationController controller;
  const AddLocationButton({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorBlack1,
        ),
        onPressed: controller.onGoPress,
        child: Text(
          AppLocalKeys.go.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.colorWhite1),
        ),
      ),
    );
  }
}
