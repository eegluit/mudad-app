import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeController extends GetxController{
  final Rx<GlobalKey> qrKey = GlobalKey(debugLabel: 'QR').obs;
  Rx<Barcode> result = Barcode("", BarcodeFormat.aztec, []).obs;
  Rx<QRViewController>? qrController ;
   onQRViewCreated(QRViewController controller) {
    Future.delayed(const Duration(seconds: 1),(){
      qrController = controller.obs;
      controller.scannedDataStream.listen((scanData) {
        result.value = scanData;
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