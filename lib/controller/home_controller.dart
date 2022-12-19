import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user_model.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../service/credit_service.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  final searchController = TextEditingController();
  var isFile = false.obs;
  var isLoading = false.obs;
  var creditService = CreditService();

  String get getToken => storage.read('token') ?? '';
  void setToken(String value) => storage.write('token', value);

  UserModel get getUser {
    var model = storage.read('user');
    if (model is UserModel) {
      return model;
    } else {
      return UserModel.fromJson(model);
    }
  }

  void setUser(UserModel value) => storage.write('user', value);

  Future<File> pdfPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      isFile(true);
      return File(result.files.single.path!);
    } else {
      isFile(false);
      return File('');
      // User canceled the picker
    }
  }
}
