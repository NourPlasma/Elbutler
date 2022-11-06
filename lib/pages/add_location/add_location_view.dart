import 'package:ebutler_task/pages/add_location/widgets/add_location_appbar.dart';
import 'package:ebutler_task/pages/add_location/widgets/add_location_button.dart';
import 'package:ebutler_task/pages/add_location/widgets/add_location_map.dart';
import 'package:ebutler_task/pages/add_location/widgets/add_location_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/app_const/colors.dart';
import 'add_location_controller.dart';

class AddLocationView extends StatelessWidget {
  final AddLocationController controller = Get.find();

  AddLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddLocationAppbar(controller: controller),
          const Divider(height: 2, color: AppColors.colorGrey2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  AddLocationMap(controller: controller),
                  AddLocationTextField(
                      hintText: 'Lat :', controller: controller.latController),
                  AddLocationTextField(
                      hintText: 'Lng :', controller: controller.lngController),
                  AddLocationButton(controller: controller),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
