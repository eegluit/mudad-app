import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';
import '../service/auth_service.dart';
import '../widget/log_print/log_print_condition.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  Timer? countdownTimer;
  var timeCount = 60.obs;
  var isLoading = false.obs;
  var authService = AuthService();

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final seconds = timeCount.value - 1;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        timeCount(seconds);
      }
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
    timeCount(0);
  }

  void resetTimer() {
    stopTimer();
    timeCount(60);
  }

  @override
  Future<void> onInit() async {
    DocumentReader.prepareDatabase("Full").then((s) {
      // do something
    }).catchError((Object error) =>
        logPrint("error rer ${(error as PlatformException).message ?? ""}"));
    DocumentReader.runAutoUpdate("Full").then((s) {
      // do something
    }).catchError(
            (Object error) => print((error as PlatformException).message));

    logPrint("Initializing...");
    ByteData byteData = await rootBundle.load("assets/regula.license");

    DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
      "delayedNNLoad": true
    });
    logPrint("Initialized");
    //     .then((s) {
    //   log(s);
    //   //isInitialise.value = true;
    // }).catchError((Object error) async {
    //   //logPrint((error as PlatformException).message ?? "");
    //   logPrint("error rer ${(error.toString()) ?? ""}");
    // });
    super.onInit();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }
}
