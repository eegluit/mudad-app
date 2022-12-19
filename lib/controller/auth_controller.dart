import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  var authService = AuthService();
}
