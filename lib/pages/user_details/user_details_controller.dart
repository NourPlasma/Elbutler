import 'dart:async';

import 'package:ebutler_task/base/models/dummy_location_model.dart';
import 'package:ebutler_task/base/models/user_model.dart';
import 'package:get/get.dart' as gt;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class UserDetailsController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  late UserModel userModel;
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(
      0.0,
      0.0,
    ),
  );
  List<DummyLocationModel> dummyLocationList = [
    DummyLocationModel(lat: 25.636637, lng: 4.348539, name: 'dummy location 1'),
    DummyLocationModel(lat: -8.11880, lng: 35.60526, name: 'dummy location 2'),
    DummyLocationModel(lat: -6.495372, lng: 15.774320, name: 'dummy location 3'),
    DummyLocationModel(lat: 23.559016, lng: 28.254790, name: 'dummy location 4'),
  ];

  final Set<Marker> locationsMarker = {};

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Users controller');
    userModel = gt.Get.arguments as UserModel;
    _addMarkers();
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Users controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Users controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onBackPress() {
    gt.Get.back();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController.complete(controller);
  }

  onDeletePress({required int index}) {
    locationsMarker.removeWhere(
        (marker) => marker.markerId.value == dummyLocationList[index].name);
    dummyLocationList.removeAt(index);
    update();
  }

  void _addMarkers() {
    for (var location in dummyLocationList) {
      locationsMarker.add(
        Marker(
          markerId: MarkerId(location.name!),
          position: LatLng(location.lat!.toDouble(), location.lng!.toDouble()),
        ),
      );
    }
  }
}
