import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/image_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';
import 'package:mudad/widget/button_view/common_button.dart';
import './loan_repayment_view.dart';
import 'package:mudad/widget/toast_view/showtoast.dart';

import '../../controller/last_transaction_controller/last_transaction_controller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';

class LastTransactionScreen extends GetView<LastTransactionController> {
  static const route = '/lastTransactionScreen';
  const LastTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.showDueView.value) {
          controller.showDueView.value = false;
        } else {
          Get.back();
        }
        return false;
      },
      child: Obx(() {
        if (controller.isLoading.value) {
          // Show a loader widget here when isLoading is true
          return Container(
            color: ColorResource.white.withOpacity(1),
            child: const Center(
              child: CircularProgressIndicator(
                color: ColorResource.mainColor,
              ),
            ),
          );
        } else {
          return BaseView(
            title: "Generated Bill",
            topChild: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RO ${controller.receipt?.total ?? "-"}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    controller.showDueView.value
                        ? "Total Due"
                        : "Bill generated on ${controller.generateDate()}",
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
            onBack: () {
              if (controller.showDueView.value) {
                controller.showDueView.value = false;
              } else {
                Get.back();
              }
            },
            child: SingleChildScrollView(
              child: Obx(() => controller.showDueView.value
                  ? dueView()
                  : billGenerateView()),
            ),
          );
        }
      }),
    );
  }

  Column billGenerateView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow("Invoice #${controller.receipt?.invoice ?? "-"}", ""),
        const Divider(
          color: ColorResource.borderColor,
          thickness: 1.4,
        ),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow("Customer:", controller.receipt?.consumerName ?? "-"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow(
            "Product Summary:", controller.receipt?.productSummary ?? "-"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow("Price:", "RO ${controller.receipt?.price ?? '-'}"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow(
            "Tax percentage:", "${controller.receipt?.taxPercentage ?? "-"}%"),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        amountExpendRow(
            "Total price:", "RO ${controller.receipt?.total ?? "-"}"),
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
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin:
                  const EdgeInsets.only(top: DimensionResource.marginSizeSmall),
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
                        color: ColorResource.lightGreenColor),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImageResource.instance.transactionOne,
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
                          controller.receipt?.name ?? "-",
                          style: StyleResource.instance.styleMedium(
                              DimensionResource.fontSizeDefault,
                              ColorResource.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          controller.generateDate(),
                          style: StyleResource.instance.styleMedium(
                              DimensionResource.fontSizeDefault,
                              ColorResource.black),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "RO ${controller.receipt?.total ?? "-"}",
                    style: StyleResource.instance.styleMedium(
                        DimensionResource.fontSizeDefault, ColorResource.black),
                  ),
                ],
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
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
                horizontal: DimensionResource.marginSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Repayment Plan",
                  style: StyleResource.instance.styleMedium(
                      DimensionResource.fontSizeLarge,
                      ColorResource.secondColor),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(LoanRepaymentScreen.route,
                        arguments: ["${controller.receipt?.total}"]);
                  },
                  icon: const Icon(Icons.question_mark_rounded),
                  color: Colors.black,
                )
              ],
            )),
        const SizedBox(
          height: DimensionResource.marginSizeDefault,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeDefault),
          child: Text(
            "One Time Payment",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(1, (index) {
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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Text(
            "Split Payment",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(2, (index) {
              PaymentPlan data = controller.paymentPlan.elementAt(1 + index);
              return GestureDetector(
                onTap: () {
                  controller.selectedPlan.value = 1 + index;
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
                            visible: controller.selectedPlan.value == 1 + index,
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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Text(
            "Installment Payment",
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.secondColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(3, (index) {
              PaymentPlan data = controller.paymentPlan.elementAt(3 + index);
              return GestureDetector(
                onTap: () {
                  controller.selectedPlan.value = 3 + index;
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
                            visible: controller.selectedPlan.value == 3 + index,
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
          padding: const EdgeInsets.symmetric(
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
                'RO ${controller.receipt?.total ?? "-"}',
                style: StyleResource.instance.styleSemiBold(
                    DimensionResource.fontSizeLarge - 1,
                    ColorResource.secondColor),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
              vertical: DimensionResource.marginSizeOverExtraLarge),
          child: CommonButton(
              text: "Pay Now",
              loading: false,
              onPressed: () {
                controller.service
                    .payToMerchant(
                        controller.userID,
                        controller.receipt?.merchantUserId ?? "",
                        controller.receipt)
                    .then((value) {
                  if (value.code == 200) {
                    controller.service
                        .generateLoan(
                            value.result ?? "",
                            controller.selectedPlan.value + 1,
                            "INSTALLMENT",
                            controller.userID)
                        .then((value2) {
                      if (value2.code == 200) {
                        toastShow(
                            error: false,
                            massage: "Loan generated successfully");
                      } else {
                        toastShow(error: true, massage: value2.errorMessage);
                      }
                    });
                  } else {
                    toastShow(error: true, massage: value.errorMessage);
                  }
                });
                // Get.toNamed(AddCardScreen.route);
                // Get.toNamed(OtpValidationPage.route);
              },
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
