import 'package:get/get.dart';
import 'package:mudad/service/receipt_service.dart';
import '../../models/loan_amount_summary_response_model.dart';
import 'package:mudad/widget/toast_view/showtoast.dart';

class LoanRepaymentController extends GetxController {
  ReceiptService service = ReceiptService();
  RxInt amount = 0.obs;
  LoanSummaryResponse? loanSummaryResponse;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      amount.value = double.parse(Get.arguments[0]).toInt();
    }
    if (amount.value != 0) {
      service.getLoanAmountSummary(amount.value).then((value) {
        if (value.code == 200) {
          isLoading.value = false;
          loanSummaryResponse = value.result;
        } else {
          toastShow(error: true, massage: value.errorMessage);
          Get.back();
          isLoading.value = false;
        }
      });
    }
    super.onInit();
  }
}
