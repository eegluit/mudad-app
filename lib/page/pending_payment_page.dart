import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/dimensions_resource.dart';
import 'package:mudad/widget/step_bar_widget/step_bar_widget.dart';
import 'package:status_change/status_change.dart';

import '../controller/pending_payment_controller.dart';

class PendingPaymentPage extends GetView<PendingPaymentController> {
  static const route = '/pendingPaymentPage';
  const PendingPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Pending Payment',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1F276B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: Get.height*0.13,
              width: double.infinity,
              decoration:const BoxDecoration(
                color:  ColorResource.mainColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) ),
              ),
              margin: const EdgeInsets.only(
                left: 19,
                right: 19,
              ),
              padding: const EdgeInsets.only(
                left: DimensionResource.marginSizeLarge,
                top: DimensionResource.marginSizeLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Amount Due',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: DimensionResource.marginSizeExtraSmall,
                  ),
                  Text(
                    'RO6000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, -5.0),
                    blurRadius: 13,
                  )
                ],
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'Payment History',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF30324B),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Divider(
                    height: 0.5,
                    color: Color(0xFFCACACA),
                  ),
                  const SizedBox(
                      height: 170,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge,vertical: 10),
                        child: StepBar(currentStep: 1, stepThirdComplete: false, stepSecondComplete: false, stepFirstComplete: true, stepFourthComplete: false),
                      )),
                  const Divider(
                    height: 0.5,
                    color: Color(0xFFCACACA),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose an amount',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF30324B),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.chooseAmountList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                 () {
                                  return GestureDetector(
                                    onTap: (){
                                      controller.selectedAmount.value = index;
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                        left: index == 0 ? 0 : 15,
                                      ),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: DimensionResource.marginSizeSmall
                                        ),
                                        decoration: BoxDecoration(
                                          color: controller.selectedAmount.value == index ? ColorResource.secondColor:Colors.white,
                                          border: Border.all(
                                            color: const Color(0xFF1F276B),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(6.0),
                                        ),
                                        child:  Center(
                                          child:  Text(
                                            controller.chooseAmountList[index],
                                            style:  TextStyle(
                                              color: controller.selectedAmount.value == index ?Colors.white :Color(0xFF1F276B),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Select payment method',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF30324B),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectPaymentList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () {
                                  return GestureDetector(
                                    onTap: (){
                                      controller.selectedPay.value = index;
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: index == 0 ? 0 : 15,
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color:  controller.selectedPay.value == index?ColorResource.secondColor: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xFF1F276B),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Image.asset(controller.selectPaymentList[index],color:controller.selectedPay.value == index?Colors.white: ColorResource.secondColor,height: 18,),
                                    ),
                                  );
                                }
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Select a card',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF30324B),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 120,
                                width: 200,
                                child: Image.asset('images/card.png'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Divider(
                    height: 0.5,
                    color: Color(0xFFCACACA),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 30,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Color(0xFF30324B),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'RO3000',
                          style: TextStyle(
                            color: Color(0xFF30324B),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Pay now',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
