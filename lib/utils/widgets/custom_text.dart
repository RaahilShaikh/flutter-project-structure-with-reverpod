import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_structure_with_riverpod/utils/constants/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final double textSize;
  final double? colorOpacity;
  final Color? color;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int? maxLine;
  final FontStyle? fontStyle;

  const CustomText.secondary30W400({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.textSize = 30,
    this.color = ColorConstants.secondaryColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 1,
  });

  const CustomText.secondary16W400({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.textSize = 16,
    this.color = ColorConstants.secondaryColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 1,
  });

  const CustomText.secondary18W400({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.textSize = 18,
    this.color = ColorConstants.secondaryColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 1,
  });

  const CustomText.secondary18W700({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w700,
    this.textSize = 18,
    this.color = ColorConstants.secondaryColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 1,
  });

  const CustomText.secondary20W400({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.textSize = 20,
    this.color = ColorConstants.secondaryColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 0.7,
  });

  const CustomText.white25W700({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w700,
    this.textSize = 25,
    this.color = ColorConstants.whiteColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.colorOpacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      maxLines: maxLine,
      // softWrap: false,
      style: GoogleFonts.workSans().copyWith(
        overflow: textOverflow,
        fontWeight: fontWeight,
        color: color?.withOpacity(colorOpacity ?? 1),
        fontStyle: fontStyle,
        fontSize: (textSize).sp,
        decoration: textDecoration,
      ),
    );
  }
}
