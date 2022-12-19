import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Transactionpage extends StatelessWidget {
  static const route = '/TransactionPage';
  const Transactionpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'All Transactions',
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
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Color(0x3B000000), offset: Offset(0, 4))
          ],
        ),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
            );
          },
        ),
      ),
    );
  }
}
