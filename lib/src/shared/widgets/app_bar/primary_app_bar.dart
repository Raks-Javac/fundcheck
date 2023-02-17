import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_helpers.dart';
import '../../../core/utils/extensions.dart';
import '../../res/res.dart';
import '../render_svg.dart/render_icon.dart';

const String image = 'assets/images/arrow-left.png';

class FWidgetsPrimaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget? leadingIcon;
  const FWidgetsPrimaryAppBar(
      {super.key, required this.title, this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: context.theme.textTheme.bodyLarge!.copyWith(),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: leadingIcon ??
          GestureDetector(
              onTap: () => FNavigator.popSheet(),
              child: const FWidgetsRenderSvg(
                iconPath: FIcons.arrowLeft,
              )),
      backgroundColor: context.theme.scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
