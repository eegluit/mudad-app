import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:mudad/utils/constant/constant.dart';

import '../../widget/log_print/log_print_condition.dart';
import '../models/network_call_model/api_response.dart';
import '../network_calls/dio_client/dio_client.dart';
import '../network_calls/exception/api_error_handler.dart';
import '../utils/resource/app_constants.dart';

class HomeRepo {
  final DioClient dioClient;
  HomeRepo({required this.dioClient,});

// Future<ApiResponse> postFile(XFile file,{required bool isImage}) async {
//   FormData data ;
//   String fileName = file.path.split('/').last;
//   print("=====fileType ${file.mimeType}");
//   print("=====fileType ${file.path}");
//   if(isImage){
//     data = FormData.fromMap({
//       "profile_image": await MultipartFile.fromFile(
//           file.path,
//           filename: fileName,
//           contentType:  MediaType("image","jpg")
//       ),
//     });
//   }else{
//     String? mimeType = file.mimeType;
//     print("This is uploaded mimeType $mimeType");
//    // ['doc','pdf','jpg', 'png','jpeg'];
//     String type;
//     if(mimeType == "doc"){
//       type = "";
//     }else if(mimeType == "pdf"){
//       type = "application";
//     }else{
//       type = "image";
//     }
//     data = FormData.fromMap({
//       "cv": await MultipartFile.fromFile(
//           file.path,
//           filename: fileName,
//           contentType:  MediaType(type, mimeType!)
//       ),
//     });
//   }
//
//   try {
//     Response response = await dioClient.post(
//       AppConstants.uploadFileUri,
//       data: data,
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
  Future<ApiResponse> getDashBoard() async {
    String url = Constant.dashBoard;
    try {
      Response response = await dioClient.post(
        url,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getVendors() async {
    String url = Constant.vendorsList;
    try {
      Response response = await dioClient.post(
        url,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProfile() async {
    String url = Constant.getProfile;
    try {
      Response response = await dioClient.get(
        url,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCreditProfile() async {
    String url = Constant.getCreditProfile;
    try {
      Response response = await dioClient.get(
        url,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateProfile(Map<String,dynamic> userData,File? file) async {
    FormData data = FormData.fromMap(userData);
    if(file != null  && file.path != ""){
      String fileName = file.path.split('/').last;
      data.files.add(MapEntry("image", await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType:  MediaType("image", "jpg")
      )));
    }
    try {
      Response response = await dioClient.post(Constant.updateProfileUrl,data: data);
      logPrint("response.data ${response.data}");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      logPrint("sign in error => $e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}