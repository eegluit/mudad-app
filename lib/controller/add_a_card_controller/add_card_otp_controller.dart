import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/card_service.dart';
import 'package:mudad/model/services/auth_service.dart';

class AddCardOtpController extends GetxController {
  final otpController = TextEditingController();
  var isLoading = false.obs;
  var userID = Get.find<AuthServices>().getUserID();
  RxString paymentId = "".obs;
  var cardService = CardService();
  void onInit() {
    // TODO: implement onInit
    paymentId.value = Get.arguments[0];
    super.onInit();
  }
}
