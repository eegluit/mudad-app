import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/dimensions_resource.dart';
import '../models/notification_model.dart';
import '../widget/base_view/base_view.dart';

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
    return BaseView(
      title: "Notifications",
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: DimensionResource.marginSizeSmall),
            child: InkWell(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: DimensionResource.marginSizeLarge,vertical: DimensionResource.marginSizeSmall),
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
                              style:  TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .6
                              ),
                            ),
                            const SizedBox(
                              height: DimensionResource.marginSizeExtraSmall,
                            ),
                            Text(
                              ' ${list.elementAt(index).desciption!}',
                              style: const TextStyle(
                                color: Color(0xFF1F276B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: DimensionResource.marginSizeSmall,
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
                      // SvgPicture.asset('images/close.svg'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
