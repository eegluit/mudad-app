import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import '../service/kyc_service.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:flutter/services.dart';
import '../widget/log_print/log_print_condition.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formSignKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString nameError = "".obs;
  RxString rePasswordError = "".obs;
  var isLoading = false.obs;

  var authService = AuthService();
  var kycService = KycService();

  @override
  void onInit() {
    DocumentReader.prepareDatabase("Full").then((s) {
      // do something
    }).catchError((Object error) =>
        logPrint("error rer ${(error as PlatformException).message ?? ""}"));
    DocumentReader.runAutoUpdate("Full").then((s) {
      // do something
    }).catchError(
            (Object error) => print((error as PlatformException).message));
    // TODO: implement onInit
    super.onInit();
  }
}
