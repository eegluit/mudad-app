import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/widget/button_view/common_button.dart';

import '../../controller/add_a_card_controller/add_a_card_controller.dart';
import '../../controller/home_controller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';
import '../../widget/text_field_view/common_textfield.dart';

class AddCardScreen extends GetView<AddCardController> {
  static const route = '/addCardScreen';
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Add a payment method",
        child: Column(
          children: [
            const SizedBox(
              height: DimensionResource.marginSizeExtraLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge),
              child: Obx(
                 () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(controller.cardList.length, (index) => GestureDetector(
                      onTap: (){
                        controller.selectedCard.value = index;
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.selectedCard.value == index ? ColorResource.secondColor: ColorResource.borderColor,
                                width: 1.4
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeSmall,vertical: DimensionResource.marginSizeExtraSmall),
                        child: Image.asset(controller.cardList[index],height: 25,),
                      ),
                    )),
                  );
                }
              ),
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
                          label: "Card holder name",
                          controller: controller.nameController,
                          keyboardType: TextInputType.text,
                          hintText: "Ana S. Lopes".tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              controller.nameError.value = "Please enter card holder name.".tr;
                              return "";
                            } else if (value.removeAllWhitespace == "") {
                              controller.nameError.value = "Please enter valid name.".tr;
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
                              controller.cardNumberError.value = "Please enter card number.".tr;
                              return "";
                            } else if (value.removeAllWhitespace == "") {
                              controller.cardNumberError.value = "Please enter valid card number.".tr;
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
                          label: "Expiry date",
                          controller: controller.expController,
                          keyboardType: TextInputType.number,
                          hintText: "01/23".tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              controller.expError.value = "Please enter card number.".tr;
                              return "";
                            } else if (value.removeAllWhitespace == "") {
                              controller.expError.value = "Please enter valid card number.".tr;
                              return null;
                            } else {
                              controller.expError.value = "";
                              return null;
                            }
                          },
                          errorText: controller.expError.value,
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
                              controller.cvvError.value = "Please enter the cvv.".tr;
                              return "";
                            } else if (value.removeAllWhitespace == "") {
                              controller.cvvError.value = "Please enter valid cvv.".tr;
                              return null;
                            } else {
                              controller.cvvError.value = "";
                              return null;
                            }
                          },
                          errorText: controller.cvvError.value,
                        ),
                        const SizedBox(
                          height: DimensionResource.marginSizeOverExtraLarge+40,
                        ),
                        CommonButton(text: "Save Card", loading: false, onPressed: (){
                          if(controller.formKey.currentState?.validate()??false){
                            
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