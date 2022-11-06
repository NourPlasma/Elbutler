import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_status/app_status.dart';
import '../auth_controller.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AuthController controller) {
        if (controller.appStatus == AppStatus.loading) {
          return const CircularProgressIndicator(
            color: AppColors.colorBlack1,
          );
        } else {
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorBlack1,
              ),
              onPressed: controller.onLoginPress,
              child: Text(
                AppLocalKeys.login.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.colorWhite1),
              ),
            ),
          );
        }
      },
    );
  }
}
