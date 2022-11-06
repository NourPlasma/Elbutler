import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_status/app_status.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddEditUserButton extends StatelessWidget {

  const AddEditUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AddEditUserController controller) {
        if (controller.appStatus == AppStatus.loading) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               CircularProgressIndicator(
                color: AppColors.colorBlack1,
              ),
            ],
          );
        } else {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBlack1,
            ),
            onPressed: controller.onSubmitPress,
            child: Text(
              AppLocalKeys.submit.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.colorWhite1),
            ),
          );
        }
      },
    );
  }
}
