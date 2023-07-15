import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';

class AddCardController extends GetxController {
RxList<String> cardList = <String>[
  ImageResource.instance.visaCard,
  ImageResource.instance.masterCard,
  ImageResource.instance.payPalCard,
].obs;
RxInt selectedCard = 0.obs;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController nameController  = TextEditingController();
TextEditingController cardNumberController  = TextEditingController();
TextEditingController expController  = TextEditingController();
TextEditingController cvvController = TextEditingController();

RxString nameError = "".obs;
RxString expError = "".obs;
RxString cardNumberError = "".obs;
RxString cvvError = "".obs;

}