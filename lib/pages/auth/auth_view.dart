import 'package:ebutler_task/base/controllers/local/local_translations.dart';
import 'package:ebutler_task/pages/auth/widgets/auth_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_textfield.dart';


class AuthView extends StatelessWidget {
  final AuthController controller = Get.find();

  AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthText(),
              AuthTextField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) =>
                controller.isValidEmail ? null : AppLocalKeys.invalidEmailMsg.tr,
                hintText: AppLocalKeys.email.tr,
                icon: const Icon(Icons.email),
              ),
              AuthTextField(
                keyboardType: TextInputType.text,
                controller: controller.passwordController,
                obscureText: true,
                validator: (value) =>
                controller.isValidPassword ? null : AppLocalKeys.invalidPasswordMsg.tr,
                hintText: AppLocalKeys.password.tr,
                icon: const Icon(Icons.security),
              ),
              const AuthButton(),
            ],
          ),
        ),
      ),
    );
  }
}
