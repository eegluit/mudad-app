import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController  = TextEditingController();
  TextEditingController newPasswordController  = TextEditingController();
  TextEditingController reEnterPasswordController  = TextEditingController();
  RxString oldPasswordError = "".obs;
  RxString newPasswordError = "".obs;
  RxString reEnterPasswordError = "".obs;
}