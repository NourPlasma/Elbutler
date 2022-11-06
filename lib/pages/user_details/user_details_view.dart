import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:ebutler_task/pages/user_details/widgets/user_details_appbar.dart';
import 'package:ebutler_task/pages/user_details/widgets/user_details_info.dart';
import 'package:ebutler_task/pages/user_details/widgets/user_details_location.dart';
import 'package:ebutler_task/pages/user_details/widgets/user_details_location_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base/app_const/colors.dart';


class UserDetailsView extends StatelessWidget {
  final UserDetailsController controller = Get.find();

  UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero,children: [
        UserDetailsAppbar(controller: controller,),
        const Divider(height: 2, color: AppColors.colorGrey2),
        UserDetailsInfo(controller:controller),
        const UserDetailsLocation(),
        const UserDetailsLocationList(),
      ],),
    );
  }
}
