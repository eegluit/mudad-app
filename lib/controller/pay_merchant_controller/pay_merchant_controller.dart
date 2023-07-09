import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';

class PayMerchantController extends GetxController {
RxList<String> cardList = <String>[
  ImageResource.instance.visaCard,
  ImageResource.instance.masterCard,
  ImageResource.instance.payPalCard,
].obs;
RxInt selectedCard = 0.obs;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController textController  = TextEditingController();
TextEditingController amountController  = TextEditingController();
RxString textError = "".obs;
RxString amountError = "".obs;

}