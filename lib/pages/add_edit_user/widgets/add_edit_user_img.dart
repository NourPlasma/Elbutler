import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_const/assets.dart';

class AddEditUserImg extends StatelessWidget {
  const AddEditUserImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AddEditUserController controller) {
      return GestureDetector(
        onTap: controller.onAddProfilePicPress,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipOval(
                  child: controller.isAssetsSelected
                      ? Image.file(
                          File(
                            controller.newAssetsImage!.path,
                          ),
                          fit: BoxFit.fill,
                          width: 80,
                          height: 80,
                        )
                      : controller.isEdit
                          ? CachedNetworkImage(
                              imageUrl: controller.oldNetworkImg,
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: AppColors.colorBlack1,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                AppAssets.profileDummy,
                                width: 80,
                                height: 80,
                              ),
                            )
                          : Image.asset(
                              AppAssets.profileDummy,
                              width: 80,
                              height: 80,
                            ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: AppColors.colorGrey1, blurRadius: 3)
                        ],
                        color: AppColors.colorBlack1,
                        border:
                            Border.all(color: AppColors.colorWhite1, width: 1),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.colorWhite1,
                      size: 20,
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
