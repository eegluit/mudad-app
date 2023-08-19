import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/page/add_card/add_a_card.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:mudad/page/home/qr_code_scanner_view/pay_merchant.dart';

class VendorDetailsController extends GetxController {
  RxString name = "".obs;
  RxString address = "".obs;
  RxString userId = "".obs;
  RxString lat = "".obs;
  RxString long = "".obs;
  RxString logo = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    final Map<String, dynamic> args = Get.arguments;
    name.value = args['name'];
    address.value = args['address'];
    userId.value = args['userId'];
    lat.value = args['lat'];
    long.value = args['long'];
    logo.value = args['logo'];
    super.onInit();
  }
}
