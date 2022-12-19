import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../service/credit_service.dart';

class PersonalController extends GetxController {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final incomeController = TextEditingController();

  var gender = ''.obs;

  var isLoading = false.obs;
  var creditService = CreditService();
}