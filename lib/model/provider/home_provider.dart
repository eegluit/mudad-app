import 'dart:io';

import 'package:flutter/material.dart';

import '../models/network_call_model/api_response.dart';
import '../models/network_call_model/error_response.dart';
import '../../models/get_vendors_response_model.dart';
import '../repository/home_repo.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepo homeRepo;
  HomeProvider({required this.homeRepo});

// Future uploadFile(XFile file,bool isImage,{required Function(bool? status, String? message) onError,
//   required Function(bool? status, String? message, Map<String,dynamic>? map) onSuccess}) async {
//   notifyListeners();
//   ApiResponse apiResponse = await accountRepo.postFile(file,isImage: isImage);
//   if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//     Map<String,dynamic> map = apiResponse.response!.data;
//     String message = map["message"];
//     onSuccess(true,message,map);
//   } else {
//     String errorMessage;
//     if (apiResponse.error is String) {
//       print(apiResponse.error.toString());
//       errorMessage = apiResponse.error.toString();
//     } else {
//       ErrorResponse errorResponse = apiResponse.error;
//       print(errorResponse.errors![0].message);
//       errorMessage = errorResponse.errors![0].message!;
//     }
//     onError(false, errorMessage);
//     notifyListeners();
//   }
// }

  Future updateProfile(
      {required Map<String, dynamic> userData,
      File? image,
      required Function(String? message) onError,
      required Function(String? message, Map<String, dynamic>? map)
          onSuccess}) async {
    ApiResponse apiResponse = await homeRepo.updateProfile(userData, image);
    if (apiResponse.response != null && apiResponse.response != null
        ? apiResponse.response!.statusCode == 200 ||
            apiResponse.response!.statusCode == 201
        : false) {
      Map<String, dynamic> map = apiResponse.response!.data;
      String message = "success";
      onSuccess(message, map);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors![0].message!;
      }
      onError(errorMessage);
    }
  }

  Future getDashBoard(
      {required Function(bool? status, String? message) onError,
      required Function(
              bool? status, String? message, Map<String, dynamic>? map)
          onSuccess}) async {
    ApiResponse apiResponse = await homeRepo.getDashBoard();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      String message = map["message"] ?? "";
      onSuccess(true, message, map);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors![0].message!;
      }
      onError(false, errorMessage);
      notifyListeners();
    }
  }

  // Future getVendors(
  //     {required Function(bool? status, String? message) onError,
  //     required Function(
  //             bool? status, String? message, Map<String, dynamic>? map)
  //         onSuccess}) async {
  //   GetVendorsResponseModel apiResponse = await homeRepo.getVendors();
  //   if (apiResponse.code == 200) {
  //     notifyListeners();
  //   } else {
  //     String errorMessage;
  //     errorMessage = apiResponse.message;
  //     onError(false, errorMessage);
  //     notifyListeners();
  //   }
  // }

  Future getProfile(
      {required Function(bool? status, String? message) onError,
      required Function(
              bool? status, String? message, Map<String, dynamic>? map)
          onSuccess}) async {
    ApiResponse apiResponse = await homeRepo.getProfile();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      String message = map["message"] ?? "";
      onSuccess(true, message, map);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors![0].message!;
      }
      onError(false, errorMessage);
      notifyListeners();
    }
  }

  Future getCreditProfile(
      {required Function(bool? status, String? message) onError,
      required Function(
              bool? status, String? message, Map<String, dynamic>? map)
          onSuccess}) async {
    ApiResponse apiResponse = await homeRepo.getCreditProfile();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      String message = map["message"] ?? "";
      onSuccess(true, message, map);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors![0].message!;
      }
      onError(false, errorMessage);
      notifyListeners();
    }
  }
}
