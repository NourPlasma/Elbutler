import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class AddLocationController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  double currentLng = 0.0;
  double currentLat = 0.0;
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(
      0.0,
      0.0,
    ),
  );

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Add Location controller');
    _getCurrentLocation();
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Add Location controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Add Location controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onBackPress() {
    gt.Get.back();
  }

  void onAddPress() {
    gt.Get.back();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController.complete(controller);
  }

  void onCurrentMapLocation({required CameraPosition position}) async {
    latController.text = position.target.latitude.toString();
    lngController.text = position.target.longitude.toString();
    currentLat = position.target.latitude;
    currentLng = position.target.longitude;
  }

  _animateToNewPosition() async {
    final GoogleMapController googleMapControllerFuture =
        await googleMapController.future;
    googleMapControllerFuture
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        currentLat,
        currentLng,
      ),
    )));
  }

  _getCurrentLocation() async {
    await Location().getLocation().then((location) {
      currentLng = location.longitude!;
      currentLat = location.latitude!;
      logController.blue(msg: '$currentLng $currentLat');
      latController.text = currentLat.toString();
      lngController.text = currentLng.toString();
      _animateToNewPosition();
    });
  }

  void onGoPress() {
    currentLat = double.parse(latController.text);
    currentLng = double.parse(lngController.text);
    _animateToNewPosition();
  }
}
