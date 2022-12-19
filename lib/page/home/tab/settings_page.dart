import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/home_controller.dart';
import '../../auth_page/sign_in_page.dart';
import '../../verify_identity/verify_identity_page.dart';

class SettingsPage extends StatelessWidget {
  static HomeController homeController = Get.find<HomeController>();
  const SettingsPage({Key? key}) : super(key: key);

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
            'images/settings.svg',
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 16,
            ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF111850),
                            width: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Sara Ahmed',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFF1F306B),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          Get.toNamed(VerifyIdentityPage.route);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('images/cong_check.svg'),
                            Text(
                              ' Verified',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  color: Color(0xFF641F6B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  color: Color(0xFFCACACA),
                  height: 0.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Settings',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Edit profile',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Change password',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Refer a friend',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Add a payment method',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.add,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: Color(0xFFCACACA),
                  height: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'More',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text(
                            'About us',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Privacy policy',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Terms and conditions',
                            style: TextStyle(
                              color: Color(0xFF1F306B),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF4B4B4B),
                          ),
                          const SizedBox(
                            width: 36,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          homeController.storage.erase();
                          Get.offAndToNamed(SignInPage.route);
                        },
                        child: Row(
                          children: [
                            const Text(
                              'Logout',
                              style: TextStyle(
                                color: Color(0xFF1F306B),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(child: Container()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF4B4B4B),
                            ),
                            const SizedBox(
                              width: 36,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
