import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/auth_service.dart';

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
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }
}
