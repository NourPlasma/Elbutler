import 'package:ebutler_task/pages/user_details/user_details_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../base/app_const/colors.dart';
import '../../../base/app_const/const.dart';
import '../../../base/controllers/local/local_translations.dart';

class UserDetailsLocation extends StatelessWidget {


  const UserDetailsLocation({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (UserDetailsController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalKeys.locations.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.colorBlack1,
                      fontSize: 50,
                      fontFamily: AppConst.shalimarFamily)),
              SizedBox(
                height: 200,
                child: GoogleMap(
                  markers: controller.locationsMarker,
                  onMapCreated: controller.onMapCreated,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
                      Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
                  initialCameraPosition: controller.initialCameraPosition,
                  //markers: Set.from(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
