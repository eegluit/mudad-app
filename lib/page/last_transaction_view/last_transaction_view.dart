import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';
import 'package:mudad/widget/button_view/common_button.dart';

import '../../controller/last_transaction_controller/last_transaction_controller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';

class LastTransactionScreen extends GetView<LastTransactionController> {
  static const route = '/lastTransactionScreen';
  const LastTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(controller.showDueView.value){
          controller.showDueView.value = false;
        }else{
          Get.back();
        }
        return false;
      },
      child: BaseView(
          title: "Last Transaction",
          topChild: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'RO10000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.showDueView.value? "Total Due": "Bill generated on 1st Jan",
                  style: TextStyle(
                    color: ColorResource.borderColor.withOpacity(0.7),
                    fontSize: 14,
                    letterSpacing: .5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          onBack: (){
            if(controller.showDueView.value){
              controller.showDueView.value = false;
            }else{
              Get.back();
            }
          },
          child: Obx(() =>
              controller.showDueView.value ? dueView() : billGenerateView())),
    );
  }

  Column billGenerateView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        const Divider(
          color: ColorResource.borderColor,
          thickness: 1.4,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow("Spends in December", "RO10000"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow("Minimum Amount Due", "RO10000"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        const Divider(
          color: ColorResource.borderColor,
          thickness: 1.4,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Text(
            "Transaction",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(controller.transactionList.length, (index) {
              TransactionList data =
                  controller.transactionList.elementAt(index);
              return Container(
                margin: EdgeInsets.only(top: DimensionResource.marginSizeSmall),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorResource.greenColor.withOpacity(0.3)))),
                padding: const EdgeInsets.symmetric(
                    horizontal: DimensionResource.marginSizeSmall,
                    vertical: DimensionResource.marginSizeSmall),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: data.color),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        data.image ?? "",
                        height: 45,
                      ),
                    ),
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name ?? "",
                            style: StyleResource.instance.styleMedium(
                                DimensionResource.fontSizeDefault,
                                ColorResource.black),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            data.date ?? "",
                            style: StyleResource.instance.styleMedium(
                                DimensionResource.fontSizeDefault,
                                ColorResource.black),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data.price ?? "",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              vertical: DimensionResource.marginSizeOverExtraLarge),
          child: CommonButton(
              text: "Pay Now",
              loading: false,
              onPressed: () {
                controller.showDueView.value = true;
              },
              color: ColorResource.mainColor),
        )
      ],
    );
  }

  Column dueView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        const Divider(
          color: ColorResource.borderColor,
          thickness: 1.4,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Text(
            "Payment Plan",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(controller.paymentPlan.length, (index) {
              PaymentPlan data = controller.paymentPlan.elementAt(index);
              return GestureDetector(
                onTap: () {
                  controller.selectedPlan.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: DimensionResource.marginSizeLarge),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorResource.borderColor),
                        child: Visibility(
                            visible: controller.selectedPlan.value == index,
                            child: const Icon(
                              Icons.circle,
                              color: ColorResource.secondColor,
                              size: 15,
                            )),
                      ),
                      const SizedBox(
                        width: DimensionResource.marginSizeDefault,
                      ),
                      Expanded(
                        child: Text(
                          data.title ?? "",
                          style: StyleResource.instance.styleMedium(
                              DimensionResource.fontSizeDefault,
                              ColorResource.textColor_8),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.price ?? "",
                            style: StyleResource.instance.styleMedium(
                                DimensionResource.fontSizeDefault,
                                ColorResource.black),
                          ),
                          Text(
                            data.percentage ?? "",
                            style: StyleResource.instance.styleRegular(
                                DimensionResource.fontSizeSmall,
                                ColorResource.textColor_8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        const Divider(
          color: ColorResource.borderColor,
          thickness: 1.4,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Text(
            "Payment Method",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(controller.paymentMethod.length, (index) {
              PaymentPlan data = controller.paymentMethod.elementAt(index);
              return GestureDetector(
                onTap: () {
                  controller.selectedPayment.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: DimensionResource.marginSizeLarge),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorResource.borderColor),
                        child: Visibility(
                            visible: controller.selectedPayment.value == index,
                            child: const Icon(
                              Icons.circle,
                              color: ColorResource.secondColor,
                              size: 15,
                            )),
                      ),
                      const SizedBox(
                        width: DimensionResource.marginSizeDefault,
                      ),
                      Expanded(
                        child: Text(
                          data.title ?? "",
                          style: StyleResource.instance.styleMedium(
                              DimensionResource.fontSizeDefault,
                              ColorResource.textColor_8),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.price ?? "",
                            style: StyleResource.instance.styleMedium(
                                DimensionResource.fontSizeDefault,
                                ColorResource.black),
                          ),
                          Text(
                            data.percentage ?? "",
                            style: StyleResource.instance.styleRegular(
                                DimensionResource.fontSizeSmall,
                                ColorResource.textColor_8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: DimensionResource.marginSizeOverExtraLarge + 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payable",
                style: StyleResource.instance.styleMedium(
                    DimensionResource.fontSizeLarge - 1,
                    ColorResource.black.withOpacity(0.7)),
              ),
              Text(
                "RO10,000",
                style: StyleResource.instance.styleSemiBold(
                    DimensionResource.fontSizeLarge - 1,
                    ColorResource.secondColor),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              vertical: DimensionResource.marginSizeOverExtraLarge),
          child: CommonButton(
              text: "Pay Now",
              loading: false,
              onPressed: () {},
              color: ColorResource.mainColor),
        )
      ],
    );
  }

  Padding amountExpendRow(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DimensionResource.marginSizeLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge - 1,
                ColorResource.black.withOpacity(0.4)),
          ),
          Text(
            price,
            style: StyleResource.instance.styleSemiBold(
                DimensionResource.fontSizeLarge - 1,
                ColorResource.black.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}