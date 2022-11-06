import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:flutter/material.dart';

import '../../../base/app_const/assets.dart';


class UserDetailsInfo extends StatelessWidget {
  final UserDetailsController controller;
  const UserDetailsInfo({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(15),
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
                Text(controller.userModel.name ?? 'Dummy Name',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.colorBlack1,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(controller.userModel.description ?? 'Dummy Description',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.colorBlack1,
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: controller.userModel.avatar.toString(),
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
    );
  }
}
