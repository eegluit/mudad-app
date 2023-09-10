import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mudad/models/generate_receipt_response_model.dart';
import 'package:mudad/models/kyc_upload_doc_response_model.dart';
import 'package:mudad/models/kyc_upload_selfie_response_model.dart';
import '../utils/constant/constant.dart';
import '../models/kyc_id_type_request_model.dart';
import '../models/kyc_id_type_response_model.dart';
import '../models/upload_profile_selfie_response_model.dart';
import '../models/get_kyc_details_response_model.dart';
import '../models/get_profile_selfie_response_model.dart';

class ReceiptService {
  Future<GenerateReceiptResponseModel> getMerchantReceipt(
      String receiptId, String consumerId) async {
    try {
      print("ABC 01");
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.generateReceipt}/${receiptId}/${consumerId}',
        data: {},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA=='
          },
        ),
      );
      print("ABC 02 ${response}");
      GenerateReceiptResponseModel model =
          GenerateReceiptResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        GenerateReceiptResponseModel model =
            GenerateReceiptResponseModel.fromJson(e.response!.data);
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
          //message: e.message,
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
          errorMessage: e.message,
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
        errorMessage: e.message,
        code: 400,
      );
      return model;
    }
  }
}
