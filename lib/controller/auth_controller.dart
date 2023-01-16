import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';

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
}
