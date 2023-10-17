import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:mudad/service/transaction_service.dart';
import '../models/get_trasactions_list_reaponse_model.dart';

class TransactionListController extends GetxController {
  RxBool isLoading = false.obs;
  TransactionService txnService = TransactionService();
  List<TranactionResponseModel> txnList = [];
  var userID = Get.find<AuthServices>().getUserID();
  @override
  void onInit() {
    // TODO: implement onInit
    isLoading.value = true;
    txnService.getTransactionList(userID).then((value) {
      txnList = value.result!;
      isLoading.value = false;
    });
    super.onInit();
  }
}
