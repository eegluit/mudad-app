import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/widget/button_view/common_button.dart';
import '../../controller/add_a_card_controller/add_a_card_controller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';
import '../../widget/text_field_view/common_textfield.dart';
import './add_card_otp_page.dart';

class AddCardScreen extends GetView<AddCardController> {
  static const route = '/addCardScreen';
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Add a payment method",
        child: SingleChildScrollView(
            child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: DimensionResource.marginSizeLarge),
            //   child: Obx(() {
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: List.generate(
            //           controller.cardList.length,
            //           (index) => GestureDetector(
            //                 onTap: () {
            //                   controller.selectedCard.value = index;
            //                 },
            //                 child: Container(
            //                   width: 100,
            //                   decoration: BoxDecoration(
            //                       border: Border.all(
            //                           color:
            //                               controller.selectedCard.value == index
            //                                   ? ColorResource.secondColor
            //                                   : ColorResource.borderColor,
            //                           width: 1.4),
            //                       borderRadius: BorderRadius.circular(5)),
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: DimensionResource.marginSizeSmall,
            //                       vertical:
            //                           DimensionResource.marginSizeExtraSmall),
            //                   child: Image.asset(
            //                     controller.cardList[index],
            //                     height: 25,
            //                   ),
            //                 ),
            //               )),
            //     );
            //   }),
            // ),
            const SizedBox(
              height: DimensionResource.marginSizeOverExtraLarge + 20,
            ),
            Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DimensionResource.marginSizeLarge),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextField(
                        label: "Card holder name",
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        hintText: "Ana S. Lopes".tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.nameError.value =
                                "Please enter card holder name.".tr;
                            return "";
                          } else if (value.removeAllWhitespace == "") {
                            controller.nameError.value =
                                "Please enter valid name.".tr;
                            return null;
                          } else {
                            controller.nameError.value = "";
                            return null;
                          }
                        },
                        errorText: controller.nameError.value,
                      ),
                      const SizedBox(
                        height: DimensionResource.marginSizeLarge,
                      ),
                      CommonTextField(
                        label: "Card number",
                        controller: controller.cardNumberController,
                        keyboardType: TextInputType.number,
                        hintText: "0000 0000 0000 0000".tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.cardNumberError.value =
                                "Please enter card number.".tr;
                            return "";
                          } else if (value.removeAllWhitespace == "") {
                            controller.cardNumberError.value =
                                "Please enter valid card number.".tr;
                            return null;
                          } else {
                            controller.cardNumberError.value = "";
                            return null;
                          }
                        },
                        errorText: controller.cardNumberError.value,
                      ),
                      const SizedBox(
                        height: DimensionResource.marginSizeLarge,
                      ),
                      CommonTextField(
                        label: "Expiry Month",
                        controller: controller.expMonthController,
                        keyboardType: TextInputType.number,
                        hintText: "01".tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.expMonthError.value =
                                "Please enter expiry month.".tr;
                            return "";
                          } else if (value.removeAllWhitespace == "") {
                            controller.expMonthError.value =
                                "Please enter valid expiry month.".tr;
                            return null;
                          } else {
                            controller.expMonthError.value = "";
                            return null;
                          }
                        },
                        errorText: controller.expMonthError.value,
                      ),
                      const SizedBox(
                        height: DimensionResource.marginSizeLarge,
                      ),
                      CommonTextField(
                        label: "Expiry year",
                        controller: controller.expYearController,
                        keyboardType: TextInputType.number,
                        hintText: "28".tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.expYearError.value =
                                "Please enter card expiry year.".tr;
                            return "";
                          } else if (value.removeAllWhitespace == "") {
                            controller.expYearError.value =
                                "Please enter valid card expiry year.".tr;
                            return null;
                          } else {
                            controller.expYearError.value = "";
                            return null;
                          }
                        },
                        errorText: controller.expYearError.value,
                      ),
                      const SizedBox(
                        height: DimensionResource.marginSizeLarge,
                      ),
                      CommonTextField(
                        label: "CVV",
                        controller: controller.cvvController,
                        keyboardType: TextInputType.number,
                        hintText: "000".tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.cvvError.value =
                                "Please enter the cvv.".tr;
                            return "";
                          } else if (value.removeAllWhitespace == "") {
                            controller.cvvError.value =
                                "Please enter valid cvv.".tr;
                            return null;
                          } else {
                            controller.cvvError.value = "";
                            return null;
                          }
                        },
                        errorText: controller.cvvError.value,
                      ),
                      const SizedBox(
                        height: DimensionResource.marginSizeOverExtraLarge + 40,
                      ),
                      CommonButton(
                          text: "Save Card",
                          loading: controller.isLoading.value,
                          onPressed: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              controller.isLoading.value = true;
                              controller.cardService
                                  .addCardForUser(
                                      controller.cardNumberController.text,
                                      controller.expMonthController.text,
                                      controller.expYearController.text,
                                      controller.cvvController.text,
                                      controller.nameController.text,
                                      controller.userID)
                                  .then((value) {
                                controller.isLoading.value = false;
                                print("ABCD ${value.errorMessage}");
                                Get.toNamed(AddCardOtpPage.route);
                              });
                            }
                          },
                          color: ColorResource.mainColor)
                    ],
                  );
                }),
              ),
            )
          ],
        )));
  }
}
