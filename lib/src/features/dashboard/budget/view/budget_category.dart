import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/budget/widget/budget_cart_builder.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/widgets/app_bar/primary_app_bar.dart';

class BudgetCart extends StatelessWidget {
 const BudgetCart({super.key});

 

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const FWidgetsPrimaryAppBar(title: 'Set Budget Category'),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 30, right: 20, left: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Budget:',
                          style: context.theme.textTheme.headlineMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        addHorizonSpace(5),
                        Text(
                          '₦0.00',
                          style: context.theme.textTheme.headlineMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: FColors.primaryGreen,
                          ),
                        )
                      ],
                    ),
                    addVertSpace(35),
                    Text(
                      'Set Category',
                      style: context.theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    addVertSpace(10),
                    Expanded(
                      child: BudgetCartBuilder(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


