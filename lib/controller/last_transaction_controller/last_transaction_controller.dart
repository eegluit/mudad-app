import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:mudad/service/receipt_service.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/widget/toast_view/showtoast.dart';
import '../../models/generate_receipt_response_model.dart';
import 'package:intl/intl.dart';

class LastTransactionController extends GetxController {
  ReceiptService service = ReceiptService();
  RxBool showDueView = false.obs;
  RxInt selectedPlan = 0.obs;
  RxInt selectedPayment = 0.obs;
  RxString transactionId = "".obs;
  RxBool isLoading = true.obs;
  ReceiptResponse? receipt;
  var userID = Get.find<AuthServices>().getUserID();
  RxList<TransactionList> transactionList = <TransactionList>[
    TransactionList(
        image: ImageResource.instance.transactionOne,
        name: "Merchant Name",
        date: "22 Nov 2022",
        price: "RO 10",
        color: ColorResource.lightGreenColor),
  ].obs;
  RxList<PaymentPlan> paymentPlan = <PaymentPlan>[
    PaymentPlan(title: "Full payment", price: "", percentage: ""),
    PaymentPlan(
        title: "2 Month", price: "RO2,50/Month", percentage: "@ 10% p.a."),
    PaymentPlan(
        title: "3 Month", price: "RO1,66/Month", percentage: "@ 14% p.a."),
  ].obs;
  RxList<PaymentPlan> paymentMethod = <PaymentPlan>[
    PaymentPlan(title: "Debit card", price: "", percentage: ""),
    PaymentPlan(title: "Credit card", price: "", percentage: ""),
    PaymentPlan(title: "PayPal", price: "", percentage: ""),
  ].obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      transactionId.value = Get.arguments[0];
    }
    if (transactionId.value.isNotEmpty) {
      service
          .getMerchantReceipt(
              transactionId.value, userID)
          .then((value) {
        if (value.code == 200) {
          isLoading.value = false;
          receipt = value.result;
          toastShow(error: false, massage: value.successMessage);
        } else {
          isLoading.value = false;
          toastShow(error: true, massage: value.errorMessage);
        }
      });
    }
    super.onInit();
  }

  String generateDate() {
    var dateTime =
                DateTime.parse(receipt?.createdOn ?? "");
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}

class TransactionList {
  final String? image;
  final String? name;
  final String? date;
  final String? price;
  final Color? color;

  TransactionList({this.image, this.name, this.date, this.price, this.color});
}

class PaymentPlan {
  final String? title;
  final String? price;
  final String? percentage;

  PaymentPlan({this.title, this.percentage, this.price});
}
