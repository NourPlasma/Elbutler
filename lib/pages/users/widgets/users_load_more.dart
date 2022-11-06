import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_const/const.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class UsersLoadMore extends StatelessWidget {

  const UsersLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (UsersController controller) {
        return controller.isLoadMore
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: AppColors.colorBlack1,
                ),
              )
            : Container();
      }
    );
  }
}
