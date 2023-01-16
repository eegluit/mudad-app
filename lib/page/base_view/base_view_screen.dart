import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';


class BaseMainView<T extends GetxController> extends GetView {
  final T viewControl;
  final AppbarPerimeter? appbarPerimeter;
  final BottomBarPerimeter? bottomBarPerimeter;
  final Widget Function(BuildContext context, T value) ?floatingActionButton;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  const BaseMainView({Key? key, required this.viewControl, required this.onPageBuilder, this.appbarPerimeter, this.bottomBarPerimeter,this.floatingActionButton}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final T controller = Get.put(viewControl);
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarPerimeter != null ? _buildAppBar(context, controller, appbarPerimeter!) : _buildBlankAppBar(),
        backgroundColor: ColorResource.white,
        floatingActionButton: floatingActionButton==null?const SizedBox(): floatingActionButton!(context, controller),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: SizedBox(height: double.infinity, width: double.infinity, child: onPageBuilder(context, controller),),
        bottomNavigationBar: bottomBarPerimeter != null ? bottomBarWidget(bottomBarPerimeter!, controller) : const SizedBox(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, T controller, AppbarPerimeter appbarPerimeter) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: appbarPerimeter.elevation ?? 3,
        flexibleSpace: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
            color: appbarPerimeter.appBarBackGroundColor,
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: appbarPerimeter.onTapBackButton ?? () {Get.back();},
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: appbarPerimeter.backButtonShow == true
                            ? Icon(Icons.arrow_back_ios, color: appbarPerimeter.backButtonColor, size: 20,)
                            : const SizedBox(height: 50, width: 50,))),
                appbarPerimeter.appBarWidget == null
                    ? Flexible(
                        child: Center(
                            child: Text(
                        appbarPerimeter.title,
                        style: StyleResource.instance.styleSemiBold(DimensionResource.fontSizeExtraLarge, ColorResource.white),
                        overflow: TextOverflow.ellipsis,
                      )))
                    : appbarPerimeter.appBarWidget!(context, controller),
                appbarPerimeter.actionButton.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(children: appbarPerimeter.actionButton,),
                      )
                    : appbarPerimeter.appBarWidget == null
                        ? const SizedBox(height: 50, width: 50,)
                        : const SizedBox(width: 15),
              ],
            ),
          ),
        ));
  }

  PreferredSize _buildBlankAppBar() {
    return const PreferredSize(preferredSize: Size(0.0, 0.0), child: SizedBox());
  }

  Widget bottomBarWidget(BottomBarPerimeter bottomBarPerimeter, T controller) {
    return Container(
      height: bottomBarPerimeter.bottomBarHeight,
      width: double.infinity,
      color: bottomBarPerimeter.bottomBarBackGroundColor,
      child: bottomBarPerimeter.widget(Get.context!, controller),
    );
  }
}

class AppbarPerimeter {
  Color appBarBackGroundColor;
  Color backButtonColor;
  bool backButtonShow;
  String title;
  double? elevation;
  VoidCallback? onTapBackButton;
  List<Widget> actionButton;
  Widget Function(BuildContext context, dynamic value)? appBarWidget;
  AppbarPerimeter({this.backButtonShow = true, this.title = "", this.actionButton = const [], this.appBarBackGroundColor = ColorResource.mainColor, this.backButtonColor = ColorResource.white, this.onTapBackButton, this.elevation, this.appBarWidget});
}

class BottomBarPerimeter {
  Color bottomBarBackGroundColor;
  double bottomBarHeight;
  Widget Function(BuildContext context, dynamic value) widget;
  BottomBarPerimeter({this.bottomBarHeight = 60, required this.widget, this.bottomBarBackGroundColor = Colors.transparent});
}
