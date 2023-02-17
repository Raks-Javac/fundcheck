import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FWidgetsRenderSvg extends StatelessWidget {
  final String? iconPath;
  const FWidgetsRenderSvg({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    assert(iconPath != "");
    return SvgPicture.asset(iconPath!);
  }
}
