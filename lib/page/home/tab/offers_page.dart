import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'images/offers.svg',
          ),
        ),
        title: const Text(
          'Offers',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
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
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
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
                        children: const [
                          Text(
                            '30% off on all products',
                            style: TextStyle(
                              color: Color(0xFF1F276B),
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Expires on 20 Sep 2022',
                            style: TextStyle(
                              color: Color(0xFFEE0202),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
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
