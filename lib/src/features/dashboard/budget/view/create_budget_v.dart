import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/features/dashboard/budget/budget_provider.dart';
import 'package:fundcheck/src/features/dashboard/budget/view/budget_category.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/widgets/app_bar/primary_app_bar.dart';
import 'package:fundcheck/src/shared/widgets/buttons/primary_button.dart';
import 'package:fundcheck/src/shared/widgets/render_svg.dart/render_icon.dart';
import 'package:fundcheck/src/shared/widgets/textfield/auth_textfield.dart';
import 'package:fundcheck/src/shared/widgets/textfield/button_textfield.dart';
import 'package:intl/intl.dart';

class CreateBudget extends StatefulWidget {
  CreateBudget({super.key});

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  final TextEditingController budgetController = TextEditingController();
  DateTime? pickedDate;

  presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final budgetNotifier = ref.watch(budgetProvider);
    return Scaffold(
      body: SafeArea(
          child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const FWidgetsPrimaryAppBar(title: 'Create a Budget'),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 30, right: 20, left: 20),
                child: Column(
                  children: [
                    FAuthTField(
                      label: 'Budget amount',
                      hintText: '₦0.00',
                      useOpacityForValidation: true,
                      keyboardType: TextInputType.number,
                      textEditingController: budgetController,
                      isFieldValidated: true,
                      // isFieldValidated: budgetNotifier.amountFieldGetter,
                    ),
                    addVertSpace(15),
                    FButtonTField(
                      onTap: () => presentDatePicker(),
                      // ref
                      //     .read(budgetProvider)
                      //     .presentDatePicker(context),
                      label: 'Date to start',
                      hintText: pickedDate == null
                          ? 'Select date'
                          : DateFormat.yMMMMd().format(pickedDate!),
                      useOpacityForValidation: true,
                      isFieldValidated: true,
                    ),
                    addVertSpace(15),
                    FButtonTField(
                      onTap: () => presentDatePicker(),
                      label: 'Date to end',
                      hintText: pickedDate == null
                          ? 'Select date'
                          : DateFormat.yMMMMd().format(pickedDate!),
                      useOpacityForValidation: true,
                      isFieldValidated: true,
                    ),
                    // addVertSpace(400),
                    const Spacer(),
                    FWIdgetsPrimaryButton(
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Center(
                            child: FWidgetsRenderSvg(
                              // iconColor:
                              //     budgetNotifier.isButtonEnabledGetter == false
                              //         ? FColors.black
                              //         : FColors.white,
                              iconPath: FIcons.arrowRight,
                            ),
                          ),
                        ),
                        isEnabled: true,
                        buttonTitle: 'Next',
                        onPressed: () {
                          FNavigator.navigateToRoute(const BudgetCart());
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
