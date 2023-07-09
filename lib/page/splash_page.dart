import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../utils/utils.dart';
import '../utils/utils/resource/color_resource.dart';


class SplashPage extends GetView<SplashController> {
  static const route = '/splashPage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
          color: ColorResource.white,
        child: Center(
          child: Image.asset('images/mudad.png'),
        ),
      ),
    );
  }
}
