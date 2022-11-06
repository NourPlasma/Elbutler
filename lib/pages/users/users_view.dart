import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:ebutler_task/pages/users/widgets/users_appbar.dart';
import 'package:ebutler_task/pages/users/widgets/users_list.dart';
import 'package:ebutler_task/pages/users/widgets/users_load_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  final UsersController controller = Get.find();

  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UsersAppbar(controller: controller),
          const Divider(height: 2, color: AppColors.colorGrey2),
          const UsersList(),
          const UsersLoadMore(),
        ],
      ),
    );
  }
}
