import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_const/assets.dart';
import '../../../base/app_const/colors.dart';
import '../../../base/controllers/local/local_translations.dart';

class UserDetailsLocationListItem extends StatelessWidget {
  final UserDetailsController controller;
  final int index;

  const UserDetailsLocationListItem(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                Text(controller.dummyLocationList[index].name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.colorBlack1,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text('${controller.dummyLocationList[index].lat!} / ${controller.dummyLocationList[index].lng!}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.colorBlack1,
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBlack1,
            ),
            onPressed: ()=>controller.onDeletePress(index : index),
            child: Text(
              AppLocalKeys.delete.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.colorWhite1),
            ),
          )
        ],
      ),
    );
  }
}
