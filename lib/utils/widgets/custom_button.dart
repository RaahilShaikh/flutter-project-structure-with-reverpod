import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure_with_riverpod/utils/utils.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.isDisabled = false,
    this.showLoading = false,
    this.padding,
    this.fontSize,
  });
  final String title;
  final Function onTap;
  final double? height;
  final double? width;
  final bool isDisabled;
  final bool showLoading;
  final EdgeInsets? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDisabled) {
          onTap.call();
        }
      },
      child: Container(
        height: height ?? 65.h,
        width: width,
        decoration: BoxDecoration(
          color: ColorConstants.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: showLoading
            ? CustomLoader(
                size: (fontSize ?? 22.sp) * 1.7,
                color: ColorConstants.whiteColor,
              )
            : CustomText.white25W700(text: title),
      ),
    );
  }
}
