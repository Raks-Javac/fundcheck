import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/extensions.dart';
import '../../res/res.dart';
import '../../res/ui_helper.dart';

class FAuthTField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final int? maxLength;
  final bool useOpacityForValidation;
  final bool isFieldValidated;
  const FAuthTField(
      {Key? key,
      required this.label,
      required this.useOpacityForValidation,
      this.isFieldValidated = false,
      this.prefixIcon,
      this.maxLength,
      this.onTap,
      this.suffixIcon,
      this.hintText,
      this.keyboardType,
      this.obscureText,
      this.onChanged,
      this.formatter,
      this.validator,
      this.textEditingController,
      this.isEnabled,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: theme.textTheme.bodyMedium!.copyWith(
              // fontWeight: FontWeight.w900,
              fontSize: screenAwareSize(22, context)),
        ),
        addVertSpace(8.5.h),
        SizedBox(
          child: Material(
            color: context.theme.scaffoldBackgroundColor,
            elevation: 0,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              enabled: isEnabled,
              onTap: onTap,
              // maxLength: maxLength,
              onSaved: onSaved,
              controller: textEditingController!,
              cursorColor: context.theme.textTheme.bodyLarge?.color,
              cursorWidth: 0.7,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              validator: validator,
              inputFormatters: [
                formatter ?? FilteringTextInputFormatter.singleLineFormatter
              ],
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 14.sp),

              decoration: InputDecoration(
                  errorStyle: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                    fontSize: 10.sp,
                  ),
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(
                    left: 15.0,
                    top: 19.0,
                  ),
                  // prefixIcon: Padding(
                  //     padding: const EdgeInsets.all(13.0), child: prefixIcon),
                  suffixIcon: suffixIcon,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFieldValidated == true
                              ? theme.textTheme.bodyLarge!.color!
                              : FColors.primaryGrey.withOpacity(0.4),
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isFieldValidated == true
                            ? theme.textTheme.bodyLarge!.color!
                            : FColors.primaryGrey.withOpacity(0.4),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFieldValidated == true
                              ? theme.textTheme.bodyLarge!.color!
                              : FColors.primaryGrey,
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFieldValidated == true
                              ? theme.textTheme.bodyLarge!.color!
                              : FColors.primaryGrey.withOpacity(0.4),
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)))),
            ),
          ),
        )
      ],
    );
  }
}
