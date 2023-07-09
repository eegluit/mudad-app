import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/page/auth_page/otp_page.dart';
import 'package:mudad/page/home/qr_code_scanner_view/otp_validation_page.dart';
import 'package:mudad/page/home/qr_code_scanner_view/payment_success_page.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/widget/button_view/common_button.dart';

import 'package:mudad/controller/pay_merchant_controller/pay_merchant_controller.dart';
import 'package:mudad/utils/utils/resource/dimensions_resource.dart';
import 'package:mudad/widget/base_view/base_view.dart';
import 'package:mudad/widget/text_field_view/common_textfield.dart';



class PayMerchantScreen extends GetView<PayMerchantController> {
  static const route = '/payMerchantScreen';
  const PayMerchantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PayMerchantController());

    return BaseView(
        title: "Pay",
        child: Column(
          children: [
            const SizedBox(
              height: DimensionResource.marginSizeExtraLarge,
            ),
            const SizedBox(
              height: DimensionResource.marginSizeOverExtraLarge+20,
            ),
            Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextField(
                          label: "Add Amount",
                          controller: controller.amountController,
                          keyboardType: TextInputType.number,
                          hintText: "Enter Amount".tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              controller.amountError.value = "Please enter amount.".tr;
                              return "";
                            } else if (value.removeAllWhitespace == "") {
                              controller.amountError.value = "Please enter valid amount.".tr;
                              return null;
                            } else if (int.parse(value) >= 1000) {
                              controller.amountError.value = "Amount should be less than or equal to credit limit".tr;
                            }
                            else {
                              controller.amountError.value = "";
                              return null;
                            }
                          },
                          errorText: controller.amountError.value,
                        ),
                        const SizedBox(
                          height: DimensionResource.marginSizeLarge,
                        ),
                        CommonTextField(
                          label: "Additional Message",
                          controller: controller.textController,
                          keyboardType: TextInputType.text,
                          hintText: "Add a message (optional)".tr,
                        ),
                        const SizedBox(
                          height: DimensionResource.marginSizeOverExtraLarge+40,
                        ),
                        CommonButton(text: "Pay Now", loading: false, onPressed: (){
                          if(controller.formKey.currentState?.validate()??false){
                            Get.toNamed(OtpValidationPage.route);
                          }
                        }, color: ColorResource.mainColor)
                      ],
                    );
                  }
                ),
              ),
            )
          ],
        ));
  }
}