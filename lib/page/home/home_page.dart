import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import 'tab/main_page.dart';
import 'tab/offers_page.dart';
import 'tab/settings_page.dart';
import 'tab/vendors_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/homePage';
  static HomeController homeController = Get.find<HomeController>();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainPage(),
            OffersPage(),
            VendorsPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: SvgPicture.asset('images/home.svg'),
              text: "Home",
            ),
            Tab(
              icon: SvgPicture.asset('images/offers.svg'),
              text: "Offers",
            ),
            Tab(
              icon: SvgPicture.asset('images/vendors.svg'),
              text: "Vendors",
            ),
            Tab(
              icon: SvgPicture.asset('images/settings.svg'),
              text: "Settings",
            ),
          ],
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: false,
          labelColor: const Color(0x80000000),
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          indicatorWeight: 4,
        ),
      ),
    );
  }
}
