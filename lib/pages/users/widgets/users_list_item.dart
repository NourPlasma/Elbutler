import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebutler_task/base/app_const/assets.dart';
import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/base/models/user_model.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersListItem extends StatelessWidget {
  final UserModel userModel;
  final UsersController controller;

  const UsersListItem(
      {Key? key, required this.userModel, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> controller.onItemNormalPress(model: userModel),
      onLongPress: () => controller.onItemLongPress(
          email: userModel.email ?? 'dummy email', image: userModel.avatar ?? 'dummy image'),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.colorWhite1,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorBlack1, width: 1)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.name ?? 'Dummy Name',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.colorBlack1,
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(userModel.description ?? 'Dummy Description',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.colorBlack1,
                        fontSize: 15,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorBlack1,
                    ),
                    onPressed: controller.onAddLocationPress,
                    child: Text(AppLocalKeys.addLocation.tr,
                        style: const TextStyle(color: AppColors.colorWhite1)),
                  )
                ],
              ),
            ),
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: userModel.avatar.toString(),
                width: 70,
                height: 70,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.colorBlack1,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AppAssets.profileDummy,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
