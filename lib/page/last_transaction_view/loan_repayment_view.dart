import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';

import '../../controller/last_transaction_controller/loan_replayment_controller.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../widget/base_view/base_view.dart';

class LoanRepaymentScreen extends GetView<LoanRepaymentController> {
  static const route = '/loanRepaymentScreen';
  const LoanRepaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          Get.back();
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
          title: "Repayment Methods",
          topChild: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionResource.marginSizeLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'RO ${controller.amount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          onBack: () {
            Get.back();
          },
          child: SingleChildScrollView(
            child: dueView(),
          ),
        );
        }
      }),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "One Time Payment",
                  style: StyleResource.instance.styleMedium(
                      DimensionResource.fontSizeLarge,
                      ColorResource.secondColor),
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
            "One Month",
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
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.oneTime?.oneMonth?[0]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
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
                horizontal: DimensionResource.marginSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Split Payment",
                  style: StyleResource.instance.styleMedium(
                      DimensionResource.fontSizeLarge,
                      ColorResource.secondColor),
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
            "Two Months",
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
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.splitResponse?.twoMonth?[index]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
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
              horizontal: DimensionResource.marginSizeDefault),
          child: Text(
            "Three Months",
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
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.splitResponse?.threeMonth?[index]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
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
                horizontal: DimensionResource.marginSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Installment Payment",
                  style: StyleResource.instance.styleMedium(
                      DimensionResource.fontSizeLarge,
                      ColorResource.secondColor),
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
            "Four Months",
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
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.installmentResponse?.fourMonth?[index]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
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
              horizontal: DimensionResource.marginSizeDefault),
          child: Text(
            "Five Months",
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
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.installmentResponse?.fiveMonth?[index]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
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
              horizontal: DimensionResource.marginSizeDefault),
          child: Text(
            "Six Months",
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
            children: List.generate(6, (index) {
              return Container(
                margin: const EdgeInsets.only(
                    top: DimensionResource.marginSizeLarge),
                child: Row(
                  children: [
                    const SizedBox(
                      width: DimensionResource.marginSizeDefault,
                    ),
                    Expanded(
                      child: Text(
                        "${index + 1} Month",
                        style: StyleResource.instance.styleMedium(
                            DimensionResource.fontSizeDefault,
                            ColorResource.textColor_8),
                      ),
                    ),
                    Text(
                      "RO - ${controller.loanSummaryResponse?.installmentResponse?.sixMonth?[index]}",
                      style: StyleResource.instance.styleMedium(
                          DimensionResource.fontSizeDefault,
                          ColorResource.black),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
