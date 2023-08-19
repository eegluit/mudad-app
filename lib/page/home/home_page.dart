import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';
import '../transaction_page.dart';
import 'tab/main_page.dart';
import 'tab/offers_page.dart';
import 'tab/settings_page.dart';
import 'tab/vendors_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/homePage';
  static HomeController homeController = Get.find<HomeController>();
   HomePage({Key? key}) : super(key: key);

  List<Widget> pageList = <Widget>[
    MainPage(),
    // OffersPage(),
    VendorsPage(),
    Transactionpage(),
    SettingsPage(),];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Obx(
            () {
              return pageList[homeController.selectedIndex.value];
            }
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context,homeController),
        ),
        Obx(
        () {
    return Visibility(
    visible: homeController.isProfileLoading.value,
    child: Container(
    color: ColorResource.white.withOpacity(0.4),
    child: Center(
    child: CircularProgressIndicator(
    color: ColorResource.mainColor,
    ),
    ),
    ),
    );})
      ],
    );
  }
  Widget _buildBottomNavigationBar(BuildContext context, HomeController controller) {
    return Container(
      decoration: BoxDecoration(
          color: ColorResource.white,
          boxShadow: DecorationResource.instance.containerBoxShadow()
      ),
      child: Obx(()=>Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:List.generate(controller.bottomBarList.length, (index) => Expanded(
          child: _buildBottomBarIconTap(
              title: controller.bottomBarList[index]["title"],
              image: controller.bottomBarList[index]["image"],
              onTap:(){controller.onItemTapped(index);},
              isSelect:index==controller.selectedIndex.value),
        )),
      )),
    );
  }

  Widget _buildBottomBarIconTap({required String image,required  String title,required  VoidCallback onTap,required  bool isSelect}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height:70,
        padding:const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(Get.context!).size.width/4,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color:isSelect==true? ColorResource.mainColor:ColorResource.white,width: 4)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image,color: ColorResource.mainColor,height:title=="Transaction"?19:22,),
            SizedBox(height: title=="Transaction"?11:8,),
            Text(title,style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.textColor),)
          ],
        ),
      ),
    );
  }
}
