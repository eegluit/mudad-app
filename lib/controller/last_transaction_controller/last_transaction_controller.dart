import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';

class LastTransactionController extends GetxController{
  RxBool showDueView = false.obs;
  RxInt selectedPlan = 0.obs;
  RxInt selectedPayment = 0.obs;
RxList<TransactionList> transactionList = <TransactionList>[
  TransactionList(
    image: ImageResource.instance.transactionOne,
    name: "Merchant Name",
    date: "22 Nov 2022",
    price: "RO 10",
    color: ColorResource.lightGreenColor
  ),
  TransactionList(
      image: ImageResource.instance.transactionTwo,
      name: "Merchant Name",
      date: "22 Nov 2022",
      price: "RO 10",
      color: ColorResource.lightBrownColor
  ),
  TransactionList(
      image: ImageResource.instance.transactionThree,
      name: "Refund",
      date: "From aliexpress.com",
      price: "RO 10",
      color: ColorResource.lightPinkColor
  ),
  TransactionList(
      image: ImageResource.instance.transactionFour,
      name: "Dentist",
      date: "Paid bill via Google Pay",
      price: "RO 10",
      color: ColorResource.black.withOpacity(0.8)
  ),
].obs;
  RxList<PaymentPlan> paymentPlan = <PaymentPlan>[
    PaymentPlan(
        title: "Full payment",
        price: "",
        percentage: ""
    ),
    PaymentPlan(
        title: "2 Month",
        price: "RO2,50/Month",
        percentage: "@ 10% p.a."
    ),
    PaymentPlan(
        title: "3 Month",
        price: "RO1,66/Month",
        percentage: "@ 14% p.a."
    ),
  ].obs;
  RxList<PaymentPlan> paymentMethod = <PaymentPlan>[
    PaymentPlan(
        title: "Debit card",
        price: "",
        percentage: ""
    ),
    PaymentPlan(
        title: "Credit card",
        price: "",
        percentage: ""
    ),
    PaymentPlan(
        title: "PayPal",
        price: "",
        percentage: ""
    ),
  ].obs;
}

class TransactionList {
  final String? image;
  final String? name;
  final String? date;
  final String? price;
  final Color? color;

  TransactionList({this.image, this.name, this.date, this.price,this.color});

}

class PaymentPlan {
  final String? title;
  final String? price;
  final String? percentage;


  PaymentPlan({this.title, this.percentage, this.price});

}