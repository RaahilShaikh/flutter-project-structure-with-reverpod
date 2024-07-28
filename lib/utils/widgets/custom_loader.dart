import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project_structure_with_riverpod/utils/constants/color_constants.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, this.color = ColorConstants.primaryColor, this.size = 60});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.dotsTriangle(color: color, size: size.r);
  }
}
