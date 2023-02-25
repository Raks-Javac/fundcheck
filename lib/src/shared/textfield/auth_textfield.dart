


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

class FAuthTField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
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
  const FAuthTField({
    Key? key,
  
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
    this.onSaved
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: SizedBox(
          //  height: 40.h,
            child: Material(
              elevation: 0,
              shadowColor:FColors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                enabled: isEnabled,
                onTap: onTap,
                // maxLength: maxLength,
                onSaved: onSaved,
                controller: textEditingController!,
                cursorColor: FColors.primaryBlue,
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
                    hintText: hintText,
                    contentPadding: const EdgeInsets.only(
                      left: 15.0,
                      top: 19.0,
                    ),
                    // prefixIcon: Padding(
                    //     padding: const EdgeInsets.all(13.0), child: prefixIcon),
                    suffixIcon: suffixIcon,
                    disabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: FColors.black, width: 1.5),
                        borderRadius:
                             BorderRadius.all(Radius.circular(5.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: FColors.black, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: FColors.black, width: 1.5),
                        borderRadius:
                             BorderRadius.all(Radius.circular(5.0))),
                    enabledBorder:const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: FColors.black, width: 1.5),
                        borderRadius:
                             BorderRadius.all(Radius.circular(5.0)))),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FAuthLabel extends StatelessWidget {
  const FAuthLabel({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
         Align(
           alignment: Alignment.centerLeft,
           child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
               // fontWeight: FontWeight.w900,
                fontSize: screenAwareSize(22, context)),
                 ),
         ),
        SizedBox(height: 3.h),
      ],
    );
  }
}
