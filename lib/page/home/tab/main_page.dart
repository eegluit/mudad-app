import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../creditScore/credit_score.dart';
import '../../notification_page.dart';
import '../../pending_payment_page.dart';
import '../../transaction_page.dart';

class MainPage extends GetView<HomeController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(NotificationPage.route);
            },
            icon: SvgPicture.asset('images/notification.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 132,
              decoration: BoxDecoration(
                color: const Color(0xFF1F276B),
                borderRadius: BorderRadius.circular(20),
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
              margin: const EdgeInsets.only(
                left: 19,
                right: 19,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Available Credit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'RO10000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Flexible(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(CreditScorePage.route);
                        },
                        child: SvgPicture.asset(
                          'images/credit_score.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1F276B),
                    offset: Offset(0, -5.0),
                    blurRadius: 13,
                  )
                ],
                borderRadius: BorderRadius.only(
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
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFACB1C6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Search',
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 18,
                            minWidth: 18,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SvgPicture.asset(
                              'images/search.svg',
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xFf949494),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
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
                          height: 25,
                        ),
                        SizedBox(
                          height: 70,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFF641F6B),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('images/scan_icon.svg'),
                                    const Text(
                                      'Scan to pay',
                                      style: TextStyle(
                                        color: Color(0xFF651F6B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFF641F6B),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('images/refer_friend.svg'),
                                    const Text(
                                      'Refer a Friend',
                                      style: TextStyle(
                                        color: Color(0xFF651F6B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFF641F6B),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('images/card.svg'),
                                    const Text(
                                      'Add a card ',
                                      style: TextStyle(
                                        color: Color(0xFF651F6B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Pending Payments',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFf30324B),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(PendingPaymentPage.route);
                                },
                                child: Container(
                                  width: 130,
                                  height: 80,
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  margin: index != 0
                                      ? const EdgeInsets.only(
                                          left: 10,
                                        )
                                      : const EdgeInsets.only(
                                          left: 0,
                                        ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFF1E2668),
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
                                        height: 10,
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
                                        height: 10,
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
                              );
                            },
                          ),
                        ),
                        // SizedBox(
                        //   height: 80,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       border: Border.all(
                        //         color: const Color(0xFF641F6B),
                        //         width: 2,
                        //       ),
                        //     ),
                        //     child: Column(
                        //       children: const [],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 5,
                        right: 17,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Last Transaction',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF30324B),
                                ),
                              ),
                              Flexible(child: Container()),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Transactionpage.route);
                                },
                                child: const Text(
                                  'All Transcartions',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F276B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
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
                                  left: 8,
                                  top: 13,
                                  bottom: 7,
                                  right: 40,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            offset: const Offset(-6.0, -6.0),
                                            blurRadius: 16.0,
                                          ),
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(6.0, 6.0),
                                            blurRadius: 16.0,
                                          ),
                                        ],
                                        color: const Color(0xFFF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                "Nando`s",
                                                style: TextStyle(
                                                  color: Color(0xFF1F276B),
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                              ),
                                              Text(
                                                "-RO300",
                                                style: TextStyle(
                                                  color: Color(0xFFF24E30),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "20 Sep 2022",
                                                style: TextStyle(
                                                  color: Color(0xFF651F6B),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                              ),
                                              Text(
                                                "9:41 am",
                                                style: TextStyle(
                                                  color: Color(0xFF949494),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
