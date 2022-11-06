import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';

class AddEditUserImgDialog extends StatelessWidget {
  final AddEditUserController controller;

  const AddEditUserImgDialog({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalKeys.imgDialogMsg.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 17,
              color: AppColors.colorBlack1,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBlack1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () => controller.onChooseImagePress(ImageSource.gallery),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                AppLocalKeys.gallery.tr,
                style:
                    const TextStyle(color: AppColors.colorWhite1, fontSize: 15),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBlack1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () => controller.onChooseImagePress(ImageSource.camera),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                AppLocalKeys.camera.tr,
                style:
                    const TextStyle(color: AppColors.colorWhite1, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
