import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import '../../service/card_service.dart';
import 'package:mudad/model/services/auth_service.dart';

class AddCardController extends GetxController {
  RxList<String> cardList = <String>[
    ImageResource.instance.visaCard,
    ImageResource.instance.masterCard,
    ImageResource.instance.payPalCard,
  ].obs;
  RxInt selectedCard = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController expYearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  var cardService = CardService();
  var userID = Get.find<AuthServices>().getUserID();

  RxString nameError = "".obs;
  RxString expMonthError = "".obs;
  RxString expYearError = "".obs;
  RxString cardNumberError = "".obs;
  RxString cvvError = "".obs;
  RxBool isLoading = false.obs;
}
