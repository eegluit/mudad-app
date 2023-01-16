import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/map_view_controller/map_view_controller.dart';
import '../../../widget/base_view/base_view.dart';

class VendorMapLocation extends GetView<MapViewController> {
  static const route = '/vendorMapLocation';

  const VendorMapLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return BaseView(
          title: controller.title.value,
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: _buildMapView(context,controller)),
        );
      }
    );
  }
}
Widget _buildMapView(BuildContext context ,MapViewController controller){
  return  Obx(
    () {
      return GoogleMap(
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: controller.onMapCreated,
        markers: controller.createMarkers(),
        mapType: MapType.normal,
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: LatLng(controller.target.value.latitude ,controller.target.value.longitude),zoom: 8),
      );
    }
  );
}