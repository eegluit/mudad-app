import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:mudad/model/utils/resource/app_constants.dart';
import 'package:mudad/page/add_card/add_a_card.dart';
import 'package:mudad/page/home/change_password_view/change_password_screen.dart';
import 'package:mudad/page/home/edit_profile_view/edit_profile_screen.dart';
import 'package:mudad/page/home/info_page/info_page_view.dart';
import 'package:mudad/page/top_offers_view/refer_a_friend_view.dart';
import 'package:mudad/widget/cachednetworkimagewidget/cachednetworkimagewidget.dart';
import '../../../controller/home_controller.dart';
import '../../../model/utils/resource/image_resource.dart';
import '../../../utils/utils/resource/color_resource.dart';
import '../../../utils/utils/resource/dimensions_resource.dart';
import '../../auth_page/sign_in_page.dart';
import '../../verify_identity/verify_identity_page.dart';
import '../verification_view/verification_view.dart';

class SettingsPage extends StatelessWidget {
  static HomeController homeController = Get.find<HomeController>();
  const SettingsPage({Key? key}) : super(key: key);

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
            'images/settings.svg',
            color: ColorResource.white,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: ColorResource.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          height: Get.height-167,
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Obx(
             () {
              return Column(
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
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: cachedNetworkImage(homeController.profileData.value.profile??ImageResource.instance.defaultUser)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          Get.find<AuthService>().user.value.user?.name.toString().capitalize??"",
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
                            Get.toNamed(VerificationScreen.route);
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
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(EditProfileScreen.route);
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(ChangePasswordScreen.route);
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(ReferViewScreen.route);
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AddCardScreen.route);
                          },
                          child: Row(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // const Divider(
                  //   color: Color(0xFFCACACA),
                  //   height: 0.5,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // Text(
                        //   'More',
                        //   style: GoogleFonts.rubik(
                        //     textStyle: const TextStyle(
                        //       color: Color(0xFFADADAD),
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(InfoPageViewScreen.route,arguments: "About us ");
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(InfoPageViewScreen.route,arguments: "Privacy policy");
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(InfoPageViewScreen.route,arguments: "Terms and conditions");
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            homeController.storage.erase();
                            Get.find<AuthService>().removeToken();
                            Get.find<AuthService>().removeUserData();
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
              );
            }
          ),
        ),
      ),
    );
  }
}
