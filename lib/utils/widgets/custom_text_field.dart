import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_structure_with_riverpod/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final bool? obscureText;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final Function(String? value)? onSave;
  final Function()? onTap;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.contentPadding,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.readOnly,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.maxLine,
    this.initialValue,
    this.onSave,
    this.inputFormatters,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.workSans(fontSize: 20.sp, color: ColorConstants.secondaryColor, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      maxLines: obscureText ?? false ? 1 : maxLine,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: GoogleFonts.workSans(fontSize: 20.sp, color: ColorConstants.secondaryColor, fontWeight: FontWeight.w400, decoration: TextDecoration.none),
        errorStyle: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w400, color: ColorConstants.redColor),
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: ColorConstants.secondaryColor, width: 1.w)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: readOnly ?? false ? ColorConstants.secondaryColor : ColorConstants.primaryColor, width: 1.w)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: ColorConstants.redColor, width: 1.w)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: ColorConstants.redColor, width: 1.w)),
        contentPadding: EdgeInsets.all(16.sp),
      ),
      textAlignVertical: TextAlignVertical.center,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onSaved: onSave,
      onFieldSubmitted: onSubmit,
    );
  }
}

// class CustomSearchTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? initialValue;
//   final String? hintText;
//   final EdgeInsets? contentPadding;
//   final bool? obscureText;
//   final bool? readOnly;
//   final FocusNode? focusNode;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextInputAction? textInputAction;
//   final TextInputType? textInputType;
//   final TextAlign? textAlign;
//   final int? maxLine;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? Function(String? value)? validator;
//   final Function(String? value)? onChanged;
//   final Function(String? value)? onSubmit;
//   final Function(String? value)? onSave;
//   final Function()? onTap;
//   final Color? fillColor;
//   final bool? isHideBorder;
//
//   const CustomSearchTextField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.contentPadding,
//     this.validator,
//     this.onChanged,
//     this.onSubmit,
//     this.readOnly,
//     this.onTap,
//     this.focusNode,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.obscureText,
//     this.textInputAction,
//     this.textInputType,
//     this.textAlign,
//     this.maxLine,
//     this.initialValue,
//     this.onSave,
//     this.inputFormatters,
//     this.fillColor,
//     this.isHideBorder,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       inputFormatters: inputFormatters,
//       focusNode: focusNode,
//       readOnly: readOnly ?? false,
//       initialValue: initialValue,
//       obscureText: obscureText ?? false,
//       textAlign: textAlign ?? TextAlign.start,
//       style: TextStyle(fontSize: 14.sp, color: ColorConstants.philippineGray, fontFamily: FontFamily.rubikRegular.name, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
//       textInputAction: textInputAction ?? TextInputAction.next,
//       keyboardType: textInputType ?? TextInputType.text,
//       maxLines: obscureText ?? false ? 1 : maxLine,
//       decoration: InputDecoration(
//         hintText: hintText ?? '',
//         hintStyle: TextStyle(fontSize: 14.sp, color: ColorConstants.philippineGray, fontFamily: FontFamily.rubikRegular.name, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
//         errorStyle: TextStyle(fontSize: 12.sp, fontFamily: FontFamily.rubikRegular.name, fontWeight: FontWeight.w500, color: ColorConstants.sunsetOrange),
//         filled: fillColor != null ? true : false,
//         fillColor: fillColor,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon,
//         enabledBorder: isHideBorder ?? false ? InputBorder.none : OutlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: ColorConstants.borderColor, width: 1.4.sp)),
//         focusedBorder: isHideBorder ?? false ? InputBorder.none : OutlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: readOnly ?? false ? ColorConstants.borderColor : ColorConstants.lightBlue, width: 1.4.sp)),
//         errorBorder: isHideBorder ?? false ? InputBorder.none : OutlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: ColorConstants.sunsetOrange, width: 1.4.sp)),
//         focusedErrorBorder: isHideBorder ?? false ? InputBorder.none : OutlineInputBorder(borderRadius: BorderRadius.circular(8.sp), borderSide: BorderSide(color: ColorConstants.sunsetOrange, width: 1.4.sp)),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.sp),
//       ),
//       validator: validator,
//       onChanged: onChanged,
//       onTap: onTap,
//       onSaved: onSave,
//       onFieldSubmitted: onSubmit,
//     );
//   }
// }
