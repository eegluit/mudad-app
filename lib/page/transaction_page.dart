import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mudad/widget/base_view/base_view.dart';

import '../utils/utils/resource/color_resource.dart';
import '../utils/utils/resource/dimensions_resource.dart';
import '../utils/utils/resource/image_resource.dart';
import '../utils/utils/resource/style_resource.dart';
import '../controller/transaction_list_controller.dart';
import 'package:intl/intl.dart';


class Transactionpage extends GetView<TransactionListController> {
  static const route = '/TransactionPage';
  const Transactionpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            title: "All Transactions",
            child: Container(
              height: Get.height,
              margin:
                  const EdgeInsets.only(top: DimensionResource.marginSizeLarge),
              child: ListView.builder(
                  itemCount: controller.txnList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: DimensionResource.marginSizeLarge,
                          right: DimensionResource.marginSizeLarge,
                          top: index == 0
                              ? DimensionResource.marginSizeLarge
                              : 0,
                          bottom: index == 11
                              ? DimensionResource.marginSizeLarge
                              : 0),
                      child: _buildTransactionRowUi(
                          backGroundColor: index.isOdd
                              ? ColorResource.transactionColor
                              : ColorResource.white,
                          transactionDateAndTime: generateDate(controller.txnList[index].transactionDate ?? "-"),
                          amount: "+RO ${controller.txnList[index].paidAmount}",
                          transactionTitle:
                              controller.txnList[index].paidTo ?? '--'),
                    );
                  }),
            ));
      }
    });
  }

  String generateDate(String date) {
    var dateTime = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  Widget _buildTransactionRowUi(
      {required Color backGroundColor,
      required String transactionTitle,
      required String transactionDateAndTime,
      required String amount}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backGroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorResource.secondColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                ImageResource.instance.walletIcon,
                color: ColorResource.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionTitle,
                  style: StyleResource.instance.styleMedium(
                      DimensionResource.fontSizeExtraLarge,
                      ColorResource.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  transactionDateAndTime,
                  style: StyleResource.instance.styleRegular(
                      DimensionResource.fontSizeDefault,
                      ColorResource.textColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            amount,
            style: StyleResource.instance.styleMedium(
                DimensionResource.fontSizeLarge, ColorResource.darkGreenColor),
          ),
        ],
      ),
    );
  }
}
