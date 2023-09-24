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
import '../../models/get_vendors_response_model.dart';
import '../../models/get_offers_response_model.dart';
import '../../models/get_profile_selfie_response_model.dart';
import '../../model/models/dashboard_model/get_user_profile_details.dart';
import '../../models/get_user_loans_response_model.dart';

class HomeRepo {
  final DioClient dioClient;
  HomeRepo({
    required this.dioClient,
  });

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

  Future<GetOfferResponseModel> getOffers() async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLOffer}${Constant.offersList}',
        options: Options(
          headers: {
            'x-functions-key':
                'tJeK8IYUu9V9LebykgmZsDwqts_QhW6KZzVzHCIbIfnIAzFu9p7doQ=='
          },
        ),
      );
      GetOfferResponseModel model =
          GetOfferResponseModel.fromJson(response.data);
      model.code = response.statusCode;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetOfferResponseModel model =
            GetOfferResponseModel.fromJson(e.response!.data);
        model.code = e.response!.statusCode;
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetOfferResponseModel model = GetOfferResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 408,
        );
        return model;
      } else {
        GetOfferResponseModel model = GetOfferResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetOfferResponseModel model = GetOfferResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetVendorsResponseModel> getVendors(String token) async {
    try {
      var response = await Dio().get(
        '${Constant.baseUrl}${Constant.vendorsList}',
        options: Options(
          headers: {'authentication': 'Bearer $token'},
        ),
      );
      GetVendorsResponseModel model =
          GetVendorsResponseModel.fromJson(response.data);
      model.code = response.statusCode;
      model.message = "success";
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetVendorsResponseModel model =
            GetVendorsResponseModel.fromJson(e.response!.data);
        model.code = e.response!.statusCode;
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetVendorsResponseModel model = GetVendorsResponseModel(
          message: "Oops! Something went wrong.",
          code: 408,
        );
        return model;
      } else {
        GetVendorsResponseModel model = GetVendorsResponseModel(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetVendorsResponseModel model = GetVendorsResponseModel(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
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

  Future<ApiResponse> updateProfile(
      Map<String, dynamic> userData, File? file) async {
    FormData data = FormData.fromMap(userData);
    if (file != null && file.path != "") {
      String fileName = file.path.split('/').last;
      data.files.add(MapEntry(
          "image",
          await MultipartFile.fromFile(file.path,
              filename: fileName, contentType: MediaType("image", "jpg"))));
    }
    try {
      Response response =
          await dioClient.post(Constant.updateProfileUrl, data: data);
      logPrint("response.data ${response.data}");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      logPrint("sign in error => $e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<GetProfileSelfieResponseModel> getProfilePicture(
      String token, String userID) async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLUpdated}${Constant.profilePicture}/${userID}',
        options: Options(
          headers: {'x-functions-key': token},
        ),
      );
      GetProfileSelfieResponseModel model =
          GetProfileSelfieResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetProfileSelfieResponseModel model =
            GetProfileSelfieResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetProfileSelfieResponseModel model = GetProfileSelfieResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetUserProfileDetails> getDashboardUserDetails(
      String authToken) async {
    try {
      var response = await Dio().get(
        '${Constant.baseUrl}${Constant.dashboardProfileData}',
        options: Options(
          headers: {'Authentication': 'Bearer $authToken'},
        ),
      );
      GetUserProfileDetails model =
          GetUserProfileDetails.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetUserProfileDetails model =
            GetUserProfileDetails.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetUserProfileDetails model = GetUserProfileDetails(
          //message: "Oops! Something went wrong.",
          message: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GetUserProfileDetails model = GetUserProfileDetails(
          message: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetUserProfileDetails model = GetUserProfileDetails(
        message: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GetUserLoansResponseModel> getLoans(String userID) async {
    try {
      print("ABCD ${Constant.baseURLLMS}${Constant.getAllLoans}${userID}");
      var response = await Dio().get(
        '${Constant.baseURLLMS}${Constant.getAllLoans}${userID}',
        options: Options(
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA=='
          },
        ),
      );
      GetUserLoansResponseModel model =
          GetUserLoansResponseModel.fromJson(response.data);
      model.code = response.statusCode;
      return model;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        GetUserLoansResponseModel model =
            GetUserLoansResponseModel.fromJson(e.response!.data);
        model.code = e.response!.statusCode;
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GetUserLoansResponseModel model = GetUserLoansResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 408,
        );
        return model;
      } else {
        GetUserLoansResponseModel model = GetUserLoansResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GetUserLoansResponseModel model = GetUserLoansResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
