import 'package:flutter/material.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

class LabelContainer extends StatelessWidget {
  final Widget? child;
  final String? label;
  final String? errorText;
  final Widget? trailWidget;
  const LabelContainer(
      {Key? key,
      @required this.child,
      @required this.label,
      @required this.errorText,
      this.trailWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label!,
              style: StyleResource.instance.styleMedium(DimensionResource.fontSizeSmall, ColorResource.textColor_2),
              textAlign: TextAlign.start,
            ),
            trailWidget ?? const SizedBox()
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        child!,
        errorText == null || errorText == ""
            ? const SizedBox(
                height: 10,
              )
            : Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
                child: Text(
                  errorText!,
                  style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.errorColor),
                  textAlign: TextAlign.start,
                ),
              ),
      ]),
    );
  }
}
