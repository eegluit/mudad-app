import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';

class PendingPaymentController extends GetxController {
  RxInt selectedAmount = 0.obs;
  RxInt selectedPay = 0.obs;
  RxBool isSelected = false.obs;
  RxList<String> chooseAmountList = <String>[
    "RO3000",
    "RO6000",
    "Other",
  ].obs;
  RxList<String> selectPaymentList = <String>[
    ImageResource.instance.applePayIcon,
    ImageResource.instance.visaPayIcon,
    ImageResource.instance.payIcon,
  ].obs;
}
