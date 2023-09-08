import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/page/add_card/add_a_card.dart';
import 'package:mudad/page/home/qr_code_scanner_view/qr_code_scanner.dart';
import 'package:mudad/page/last_transaction_view/last_transaction_view.dart';
import 'package:mudad/page/top_offers_view/top_offers_view.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:mudad/utils/utils/resource/style_resource.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/home_controller.dart';
import '../../../model/services/auth_service.dart';
import '../../../utils/utils/resource/decoration_resource.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../../utils/utils/resource/image_resource.dart';
import '../../../widget/cachednetworkimagewidget/cachednetworkimagewidget.dart';
import '../../creditScore/credit_score.dart';
import '../../notification_page.dart';
import '../../pending_payment_page.dart';
import 'dart:convert';

class MainPage extends GetView<HomeController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Obx(
         () {
            return Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: ColorResource.mainColor)),
                  child: controller.profileBaseImage.value != ""
                      ? Obx(() {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.memory(
                              base64.decode(controller.profileBaseImage.value),
                              fit: BoxFit.cover,
                            ),
                          );
                        })
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: cachedNetworkImage(
                              controller.profileData.value.profile ??
                                  ImageResource.instance.defaultUser)),
                ),
                const SizedBox(
                  width: DimensionResource.marginSizeSmall,
                ),
                Obx(
                   () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Get.find<AuthServices>().user.value.name.toString().capitalize ?? "",
                          style: StyleResource.instance
                              .styleMedium(DimensionResource.fontSizeExtraLarge,
                                  ColorResource.mainColor)
                              .copyWith(letterSpacing: .6),
                        ),
                        const SizedBox(
                          height: DimensionResource.marginSizeExtraSmall,
                        ),
                        Text(
                          Get.find<AuthServices>().user.value.email.toString().capitalize ?? "",
                          style: StyleResource.instance
                              .styleMedium(DimensionResource.fontSizeDefault,
                                  ColorResource.black.withOpacity(0.5))
                              .copyWith(letterSpacing: .6),
                        ),
                      ],
                    );
                  }
                )
              ],
            );
          }
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(NotificationPage.route);
            },
            icon: Image.asset('images/notification.png'),
          ),
          const SizedBox(
            width: DimensionResource.marginSizeSmall,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: Get.height * 0.12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorResource.mainColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
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
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionResource.marginSizeLarge,
                vertical: DimensionResource.marginSizeLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Credit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: .5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Obx(
                   () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.isDashBoardLoading.value?"Loading...":  controller.dashBoardData.value.availableLimit == null?"N/A":'RO${controller.dashBoardData.value.availableLimit}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(CreditScorePage.route);
                            },
                            child: SvgPicture.asset(
                              'images/credit_score.svg',
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, -5.0),
                    blurRadius: 13,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     height: 45,
                  //     width: Get.width*0.8,
                  //     child: TextFormField(
                  //       controller: controller.searchController,
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  //         border: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //             color: Color(0xFFACB1C6),
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         hintText: 'Search',
                  //         suffixIconConstraints: const BoxConstraints(
                  //           minHeight: 18,
                  //           minWidth: 18,
                  //         ),
                  //         suffixIcon: Padding(
                  //           padding: const EdgeInsets.only(right: 15),
                  //           child: SvgPicture.asset(
                  //             'images/search.svg',
                  //           ),
                  //         ),
                  //         hintStyle: const TextStyle(
                  //           color: Color(0xFf949494),
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DimensionResource.marginSizeLarge,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFf30324B),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              quickActionWidget(
                                  image: 'images/scan_icon.png',
                                  title: "Scan to pay",
                                  onTap: () {
                                    try {
                                      Get.toNamed(QrViewScreen.route);
                                    } catch (e) {
                                      print("sd $e");
                                    }
                                  }),
                              const SizedBox(
                                width: 20,
                              ),
                              // quickActionWidget(
                              //     image: 'images/refer_friend.png',
                              //     title: "Refer a Friend",
                              //     onTap: () {
                              //       Get.toNamed(ReferViewScreen.route);
                              //     }),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              quickActionWidget(
                                  image: 'images/add_card.png',
                                  title: "Add a card",
                                  onTap: () {
                                    Get.toNamed(AddCardScreen.route);
                                  }),
                              // const SizedBox(
                              //   width: 17,
                              // ),
                              // quickActionWidget(image: 'images/scan_icon.svg',title: "Scan to pay",onTap: (){
                              //
                              // }),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pending Payments',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFf30324B),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(LastTransactionScreen.route);
                              },
                              child: Text(
                                'Generated Bill',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: ColorResource.mainColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(PendingPaymentPage.route);
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Container(
                                    width: 130,
                                    //height: 75,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: ColorResource.mainColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'images/doller_icon.svg'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'RO3000.00',
                                              style: TextStyle(
                                                color: Color(0xFF1F276B),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'images/clock_icon.svg'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Due 20 Sep 2022',
                                              style: TextStyle(
                                                color: Color(0xFFDC2424),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(child: Container()),
                                            const Text(
                                              'Pay now',
                                              style: TextStyle(
                                                color: Color(0xFF1F276B),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                                'images/send_icon.svg'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // const SizedBox(
                        //   height: DimensionResource.marginSizeLarge,
                        // ),
                      ],
                    ),
                  ),
                  // viewAllRow('Available Merchant', () {
                  //   Get.toNamed(AvailableMerchantScreen.route);
                  // }),
                  // Obx(
                  //   () {
                  //     return  controller.isMerchantLoading.value?
                  //     GridView.builder(
                  //       gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3,
                  //         crossAxisSpacing: 5,
                  //         mainAxisSpacing: 5,
                  //         childAspectRatio: 1.15,
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: DimensionResource.marginSizeLarge),
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.vertical,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: 3,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Card(
                  //           elevation: 5,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           ),
                  //           clipBehavior: Clip.antiAliasWithSaveLayer,
                  //           child: ServicesShimmer(),
                  //         );
                  //       },
                  //     ):(controller.vendorData.value.storeData?.isEmpty??true)? Center(
                  //       child: Text("At the moment, there is no merchant available.",style: StyleResource.instance.styleMedium(DimensionResource.fontSizeSmall, ColorResource.secondColor),),
                  //     ) : GridView.builder(
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3,
                  //         crossAxisSpacing: 5,
                  //         mainAxisSpacing: 5,
                  //         childAspectRatio: 1.15,
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: DimensionResource.marginSizeLarge),
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.vertical,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: (controller.vendorData.value.storeData?.length??0) >= 6?6:(controller.vendorData.value.storeData?.length??0),
                  //       itemBuilder: (BuildContext context, int index) {
                  //        StoreDatum? storeData = controller.vendorData.value.storeData!.elementAt(index);
                  //         return GestureDetector(
                  //           onTap: (){
                  //             Get.toNamed(VendorMapLocation.route,arguments: storeData?.name);
                  //           },
                  //           child: Card(
                  //             elevation: 5,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10.0),
                  //             ),
                  //             clipBehavior: Clip.antiAliasWithSaveLayer,
                  //             child: Container(
                  //               height: 80,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 border: Border.all(
                  //                   color: const Color(0xFF1E2668),
                  //                   width: 2,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.0),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Expanded(
                  //                     child: Padding(
                  //                       padding: EdgeInsets.all(10),
                  //                       child: cachedNetworkImage(
                  //                         storeData?.logo??"",
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }
                  // ),
                  viewAllRow('Top Offers on Mudad', () {
                    Get.toNamed(TopOffersScreen.route);
                  }),
                  ...List.generate(
                      3,
                      ((index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: DimensionResource.marginSizeLarge),
                            child: buildOffersBoxUi(
                                image: index.isOdd
                                    ? ImageResource.instance.offer1Icon
                                    : ImageResource.instance.offer2Icon,
                                discountDes:
                                    "Daily login bonus \$50 max discount",
                                discountTitle: "10% off your next order",
                                code: "INABFQ"),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Spacer(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.4),
                  //         offset: Offset(0, -2.0),
                  //         blurRadius: 13,
                  //       )g
                  //     ],
                  //     borderRadius: const BorderRadius.only(
                  //       topLeft: Radius.circular(20),
                  //       topRight: Radius.circular(20),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: DimensionResource.marginSizeLarge,
                  //       vertical: DimensionResource.marginSizeDefault,
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         viewAllRow('Last Transaction', () {
                  //           Get.toNamed(Transactionpage.route);
                  //         }, padding: EdgeInsets.zero),
                  //         const SizedBox(
                  //           height: 25,
                  //         ),
                  //         InkWell(
                  //           onTap: () {},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(12.0),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.black.withOpacity(0.25),
                  //                   offset: const Offset(0, -1.0),
                  //                   blurRadius: 6.0,
                  //                 ),
                  //                 BoxShadow(
                  //                   color: Colors.black.withOpacity(0.25),
                  //                   offset: const Offset(0, 2.0),
                  //                   blurRadius: 13.0,
                  //                 ),
                  //               ],
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(
                  //                 left: 8,
                  //                 top: 13,
                  //                 bottom: 7,
                  //                 right: 40,
                  //               ),
                  //               child: Row(
                  //                 children: [
                  //                   Container(
                  //                     width: 36,
                  //                     height: 36,
                  //                     decoration: BoxDecoration(
                  //                       boxShadow: [
                  //                         BoxShadow(
                  //                           color:
                  //                               Colors.white.withOpacity(0.8),
                  //                           offset: const Offset(-6.0, -6.0),
                  //                           blurRadius: 16.0,
                  //                         ),
                  //                         BoxShadow(
                  //                           color:
                  //                               Colors.black.withOpacity(0.1),
                  //                           offset: const Offset(6.0, 6.0),
                  //                           blurRadius: 16.0,
                  //                         ),
                  //                       ],
                  //                       color: const Color(0xFFF6F6F6),
                  //                       borderRadius:
                  //                           BorderRadius.circular(12.0),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.only(left: 8.0),
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           children: const [
                  //                             Text(
                  //                               "Nando`s",
                  //                               style: TextStyle(
                  //                                 color: Color(0xFF1F276B),
                  //                                 fontWeight: FontWeight.w900,
                  //                                 fontSize: 14,
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               width: 120,
                  //                             ),
                  //                             Text(
                  //                               "-RO300",
                  //                               style: TextStyle(
                  //                                 color: Color(0xFFF24E30),
                  //                                 fontWeight: FontWeight.w500,
                  //                                 fontSize: 14,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Row(
                  //                           children: const [
                  //                             Text(
                  //                               "20 Sep 2022",
                  //                               style: TextStyle(
                  //                                 color: Color(0xFF651F6B),
                  //                                 fontWeight: FontWeight.w400,
                  //                                 fontSize: 10,
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               width: 120,
                  //                             ),
                  //                             Text(
                  //                               "9:41 am",
                  //                               style: TextStyle(
                  //                                 color: Color(0xFF949494),
                  //                                 fontWeight: FontWeight.w400,
                  //                                 fontSize: 10,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 15,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding viewAllRow(String title, Function() onTap,
      {EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: DimensionResource.marginSizeLarge,
            vertical: DimensionResource.marginSizeLarge,
          ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: .6,
              fontWeight: FontWeight.w700,
              color: Color(0xFF30324B),
            ),
          ),
          Flexible(child: Container()),
          InkWell(
            onTap: onTap,
            child: Text(
              'View all',
              style: StyleResource.instance
                  .styleMedium(
                      DimensionResource.fontSizeSmall, ColorResource.mainColor)
                  .copyWith(
                      letterSpacing: .5, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionWidget(
      {required String title,
      required String image,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.zero,
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: ColorResource.mainColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: ColorResource.secondColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesShimmer extends StatelessWidget {
  const ServicesShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: 70,
          height: 70,
        ) ,
      ),
    );
  }
}

Widget buildOffersBoxUi(
    {required String image,
    required String discountTitle,
    required String discountDes,
    required String code}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResource.white,
        boxShadow: DecorationResource.instance.containerBoxShadow()),
    child: Row(
      children: [
        SizedBox(
            height: 50,
            width: 100,
            child: cachedNetworkImage(image, fit: BoxFit.contain)),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              discountTitle,
              style: StyleResource.instance.styleMedium(
                  DimensionResource.fontSizeExtraLarge,
                  ColorResource.orangeColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              discountDes,
              style: StyleResource.instance.styleRegular(
                  DimensionResource.fontSizeDefault, ColorResource.textColor_2),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(6),
                  dashPattern: const [2, 2],
                  color: ColorResource.black,
                  strokeWidth: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          code,
                          style: StyleResource.instance.styleSemiBold(
                              DimensionResource.fontSizeSmall,
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
            )
          ],
        )
      ],
    ),
  );
}
