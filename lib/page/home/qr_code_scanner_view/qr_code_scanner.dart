import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/controller/qr_code_controller/qr_code_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../../widget/base_view/base_view.dart';

class QrViewScreen extends GetView<QrCodeController> {
  static const route = '/qrViewScreen';
  const QrViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Scan to pay",
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Column(
            children: [
              Obx(
                () {
                  return Expanded(
                    child: QRView(
                      key: controller.qrKey.value,
                      onQRViewCreated: controller.onQRViewCreated,
                    ),
                  );
                }
              ),
            ],
          ),
        ));
  }
}