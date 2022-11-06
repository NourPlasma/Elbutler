import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:ebutler_task/pages/user_details/widgets/user_details_location_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_const/colors.dart';
import '../../../base/app_const/const.dart';
import '../../../base/controllers/local/local_translations.dart';

class UserDetailsLocationList extends StatelessWidget {
  const UserDetailsLocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (UserDetailsController controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalKeys.locationsList.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.colorBlack1,
                    fontSize: 50,
                    fontFamily: AppConst.shalimarFamily)),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.dummyLocationList.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (child, index) {
                  return UserDetailsLocationListItem(
                    index: index,
                    controller: controller,
                  );
                }),
          ],
        ),
      );
    });
  }
}
