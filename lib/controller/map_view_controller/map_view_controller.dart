import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController{
  GoogleMapController? mapController;
  Rx<LatLng> target = const LatLng(23.592087, 58.425701).obs;
  RxString title = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    title.value = Get.arguments;
    super.onInit();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> createMarkers() {
    return <Marker>{
      Marker(
        markerId: const MarkerId("UncleLau"),
        position: target.value,
         icon: BitmapDescriptor.defaultMarker,
       // icon: BitmapDescriptor.fromBytes(val.value),
      ),
    };

    // return <Marker>[
    //   Marker(
    //     markerId: MarkerId("UncleLau"),
    //     position: target.value,
    //     // icon: marker??BitmapDescriptor.defaultMarker,
    //     icon: BitmapDescriptor.fromBytes(val.value),
    //   ),
    // ].toSet();
  }
}