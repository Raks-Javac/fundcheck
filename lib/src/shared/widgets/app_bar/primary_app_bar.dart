import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_helpers.dart';
import '../../../core/utils/extensions.dart';

const String image = 'assets/images/arrow-left.png';

class FWidgetsPrimaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const FWidgetsPrimaryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: context.theme.textTheme.bodyLarge!.copyWith(),
      ),
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => FNavigator.popSheet(), child: Image.asset(image)),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
