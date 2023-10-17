import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mudad/models/default_response_model.dart';
import 'package:mudad/models/generate_receipt_response_model.dart';
import 'package:mudad/models/loan_amount_summary_response_model.dart';
import '../utils/constant/constant.dart';
import '../models/generate_loan_response_model.dart';

class ReceiptService {
  Future<GenerateReceiptResponseModel> getMerchantReceipt(
      String receiptId, String consumerId) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.generateReceipt}',
        data: {},
        queryParameters: {
          'MerchantBillGenerationId': receiptId,
          'consumerId': consumerId
        },
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
        GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
          errorMessage:
              "The code you entered is incorrect. Kindly process again.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GenerateReceiptResponseModel model = GenerateReceiptResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<DefaultResponseModel> payToMerchant(
      String userId, String merchantId, ReceiptResponse? receiptDetails) async {
    try {
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.paymentToMerchant}',
        data: {
          'PaidTo': receiptDetails?.name,
          'ProductId': receiptDetails?.productSummary,
          'PaidAmount': receiptDetails?.total,
          'TransactionType': 'PAYTOMERCHANT',
          'Status': "Pending",
          'IsBilled': true
        },
        queryParameters: {'merchantId': merchantId, 'userId': userId},
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA==',
            'Content-Type': 'application/json'
          },
        ),
      );
      print("ABC 02 ${response}");
      DefaultResponseModel model = DefaultResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        DefaultResponseModel model = DefaultResponseModel(
          errorMessage:
              e.message,
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        DefaultResponseModel model = DefaultResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        DefaultResponseModel model = DefaultResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      DefaultResponseModel model = DefaultResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<GenerateLoanResponseModel> generateLoan(
      String billId, int numberOfMonth, String type, String userId) async {
    try {
      print("ABC gen loan ${billId} ${numberOfMonth} ${userId}");
      var response = await Dio().post(
        '${Constant.baseURLLMS}${Constant.generateLoan}',
        data: {
          'NumberofMonth': numberOfMonth,
          'Type': type,
        },
        queryParameters: {'userId': userId, 'billId': billId},
        options: Options(
          contentType: Headers.textPlainContentType,
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA==',
            'Content-Type': 'application/json'
          },
        ),
      );
      print("ABC 02 ${response}");
      GenerateLoanResponseModel model =
          GenerateLoanResponseModel.fromJson(response.data);
      model.code = 200;
      return model;
    } on DioError catch (e) {
      print("ABCD Error ${e}");
      if (e.type == DioErrorType.response) {
        GenerateLoanResponseModel model = GenerateLoanResponseModel(
          errorMessage:
              "Failed to generate loan for the consumer.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        GenerateLoanResponseModel model = GenerateLoanResponseModel(
          //message: "Oops! Something went wrong.",
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        GenerateLoanResponseModel model = GenerateLoanResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      GenerateLoanResponseModel model = GenerateLoanResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }

  Future<LoanAmountSummaryResponseModel> getLoanAmountSummary(
      int amount) async {
    try {
      var response = await Dio().get(
        '${Constant.baseURLLMS}${Constant.getLoanAmountSummary}',
        queryParameters: {
          'amount': amount,
        },
        options: Options(
          headers: {
            'x-functions-key':
                'QFipKbWv0UxAphy05khVd_q9_xwQdmCFTlO95aDaWy1fAzFuO5VKpA==',
          },
        ),
      );
      print("ABC99 ${response}");
      LoanAmountSummaryResponseModel model =
          LoanAmountSummaryResponseModel.fromJson(response.data);
      model.code = 200;
      print("ABC99 ${model}");
      return model;
    } on DioError catch (e) {
      print("ABC99 ${e}");
      if (e.type == DioErrorType.response) {
        LoanAmountSummaryResponseModel model = LoanAmountSummaryResponseModel(
          errorMessage:
              "The code you entered is incorrect. Kindly process again.",
          code: 400,
        );
        return model;
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        LoanAmountSummaryResponseModel model = LoanAmountSummaryResponseModel(
          errorMessage: "Request timeout",
          code: 408,
        );
        return model;
      } else {
        LoanAmountSummaryResponseModel model = LoanAmountSummaryResponseModel(
          errorMessage: "Oops! Something went wrong.",
          code: 400,
        );
        return model;
      }
    } on SocketException catch (e) {
      print("ABC99 ERROR");
      LoanAmountSummaryResponseModel model = LoanAmountSummaryResponseModel(
        errorMessage: "Oops! Something went wrong.",
        code: 400,
      );
      return model;
    }
  }
}
