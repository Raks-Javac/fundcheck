import 'package:flutter/material.dart';

class FWidgetsBorderedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Widget? icon;
  const FWidgetsBorderedButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.0, color: theme.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
