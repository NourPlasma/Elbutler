import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:ebutler_task/pages/add_edit_user/widgets/add_edit_user_appbar.dart';
import 'package:ebutler_task/pages/add_edit_user/widgets/add_edit_user_button.dart';
import 'package:ebutler_task/pages/add_edit_user/widgets/add_edit_user_img.dart';
import 'package:ebutler_task/pages/add_edit_user/widgets/add_edit_user_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditUserView extends StatelessWidget {
  final AddEditUserController controller = Get.find();

  AddEditUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            AddEditUserAppbar(controller: controller),
            const Divider(height: 2, color: AppColors.colorGrey2),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                children: [
                  const AddEditUserImg(),
                  const SizedBox(height: 10,),
                  AddEditUserTextField(controller: controller),
                  const SizedBox(height: 10,),
                  const AddEditUserButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
