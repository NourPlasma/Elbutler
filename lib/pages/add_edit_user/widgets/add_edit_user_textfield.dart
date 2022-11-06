import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_status/app_status.dart';
import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/add_edit_user/add_edit_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddEditUserTextField extends StatelessWidget {
  final AddEditUserController controller;
  const AddEditUserTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          hintText: AppLocalKeys.email.tr,
        ),
        controller: controller.emailController,
        validator: (value) =>
        controller.isValidEmail ? null : AppLocalKeys.invalidEmailMsg.tr,
      ),
    );
  }
}
