import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/page/add_card/add_a_card.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:mudad/page/home/qr_code_scanner_view/pay_merchant.dart';



class QrCodeController extends GetxController{
  final Rx<GlobalKey> qrKey = GlobalKey(debugLabel: 'QR').obs;
  Rx<Barcode> result = Barcode("", BarcodeFormat.aztec, []).obs;
  Rx<QRViewController>? qrController ;
   onQRViewCreated(QRViewController controller) {
    Future.delayed(const Duration(seconds: 1),(){
      qrController = controller.obs;
      controller.scannedDataStream.listen((scanData) {
        result.value = scanData;
        Get.toNamed(PayMerchantScreen.route);
      });
    });
  }
  @override
  void onClose() {
    // TODO: implement onClose
    qrController?.value.dispose();
    super.onClose();
  }
}