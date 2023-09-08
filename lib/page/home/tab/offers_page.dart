import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);
  static HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.mainColor,
      appBar: AppBar(
        backgroundColor: ColorResource.mainColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'images/offers.svg',
            color: ColorResource.white,
          ),
        ),
        title: const Text(
          'Offers',
          style: TextStyle(
            color: ColorResource.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: DimensionResource.marginSizeLarge),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, -2.0),
              blurRadius: 8,
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          itemCount: homeController.offerList.length,
          itemBuilder: (BuildContext context, int index) {
            var dateTime =
                DateTime.parse(homeController.offerList[index].validTo ?? "");
            String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
            return Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 21,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, -2.0),
                    blurRadius: 13.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 2.0),
                    blurRadius: 13.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                  top: 14,
                  bottom: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            offset: const Offset(-6.0, -6.0),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ],
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'images/sms.svg',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeController.offerList[index].description ?? '--',
                            style: const TextStyle(
                              color: Color(0xFF1F276B),
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Expires on $formattedDate',
                            style: const TextStyle(
                              color: Color(0xFFEE0202),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Copy the text to the clipboard when tapped
                              Clipboard.setData(ClipboardData(
                                  text: homeController
                                          .offerList[index].couponCode ??
                                      '-'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Coupon copied!')),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(6),
                                  dashPattern: const [2, 2],
                                  color: ColorResource.black,
                                  strokeWidth: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          homeController.offerList[index]
                                                  .couponCode ??
                                              '-',
                                          style: StyleResource.instance
                                              .styleSemiBold(
                                                  DimensionResource
                                                      .fontSizeSmall,
                                                  ColorResource.textColor),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.copy,
                                          size: 15,
                                          color: ColorResource.black,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
