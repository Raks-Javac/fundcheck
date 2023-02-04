import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RenderSvg extends StatelessWidget {
  final String? iconPath;
  const RenderSvg({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    assert(iconPath != "");
    return SvgPicture.asset(iconPath!);
  }
}
