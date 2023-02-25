import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/extensions.dart';

class FWidgetsRenderSvg extends StatelessWidget {
  final String? iconPath;
  final double? width;
  final Color? iconColor;
  final double? height;
  const FWidgetsRenderSvg({
    super.key,
    required this.iconPath,
    this.height,
    this.width,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    assert(iconPath != "");
    return SvgPicture.asset(
      iconPath!,
      color: iconColor ?? context.theme.textTheme.bodyLarge?.color,
      width: width ?? 20.sp,
      fit: BoxFit.scaleDown,
      height: height ?? 20.sp,
    );
  }
}
