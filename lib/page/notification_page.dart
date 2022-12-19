import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/notification_model.dart';

class NotificationPage extends StatelessWidget {
  static const route = '/notificationPage';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <NotificationModel>[
      NotificationModel(
          name: 'Account',
          time: 'Now',
          desciption: 'Verify Your Account',
          type: 'account verification required '),
      NotificationModel(
          name: 'PAYMENT',
          time: '2H Ago',
          desciption: 'Payment Due',
          type: 'account verification required '),
      NotificationModel(
          name: 'Account',
          time: '2H Ago',
          desciption: 'Verify Your Account',
          type: 'account verification required '),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
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
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3B000000),
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Card(
                margin: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 20,
                ),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      list.elementAt(index).name == 'Account'
                          ? SvgPicture.asset('images/error_outline_red.svg')
                          : SvgPicture.asset('images/sms.svg'),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${list.elementAt(index).name!}  .  ${list.elementAt(index).time!}',
                              style: const TextStyle(
                                color: Color(0x8F000000),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ' ${list.elementAt(index).desciption!}',
                              style: const TextStyle(
                                color: Color(0xFF1F276B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' ${list.elementAt(index).type!}',
                              style: const TextStyle(
                                color: Color(0x8F000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset('images/close.svg'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
