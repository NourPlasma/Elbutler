import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/pages/add_location/add_location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationMap extends StatelessWidget {
  final AddLocationController controller;

  const AddLocationMap({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: controller.initialCameraPosition,
            onCameraMove: (position)=>controller.onCurrentMapLocation(position: position),
            onMapCreated: controller.onMapCreated,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
                Factory<EagerGestureRecognizer>(
                    () => EagerGestureRecognizer())),
            //markers: Set.from(),
          ),
          const Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Icon(
            Icons.location_on,
            color: AppColors.colorBlack1,
                size: 50,
          ))
        ],
      ),
    );
  }
}
