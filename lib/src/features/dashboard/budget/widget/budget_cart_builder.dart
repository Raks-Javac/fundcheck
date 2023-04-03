import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/views/bottom_nav.dart';
import 'package:fundcheck/src/features/dashboard/budget/model/budget_cart_data.dart';
import 'package:fundcheck/src/features/dashboard/budget/widget/add_budget_icon.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/widgets/buttons/primary_button.dart';
import 'package:fundcheck/src/shared/widgets/render_svg.dart/render_icon.dart';
import 'package:fundcheck/src/shared/widgets/textfield/auth_textfield.dart';

class BudgetCartBuilder extends StatelessWidget {
  BudgetCartBuilder({
    super.key,
  });

  final budgetDateList = BudgetCartModel.getBudgetCart();

  @override
  Widget build(BuildContext context) {
    // return Wrap(
    //   runSpacing: 10,
    //  // spacing: 10,
    //   children: budgetDateList
    //       .map((budget) => budgetDateList[index].isFirst
    //           ? addBudgetCart()
    //           : buildBudgetCart(context, budgetDateList[index]))
    //       .toList(),
    // );
    return GridView.builder(
        itemCount: budgetDateList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 5 / 2,
            // (itemWidth / itemHeight),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return budgetDateList[index].isFirst
              ? addBudgetCart(context)
              : buildBudgetCart(context, budgetDateList[index]);
        });
  }
}

Widget buildBudgetCart(
  BuildContext context,
  BudgetCartModel budgetCart,
) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: FColors.primaryGrey.withOpacity(0.3), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: FColors.primaryGrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(budgetCart.image!),
            ),
            addHorizonSpace(5),
            Text(
              budgetCart.label!,
              style: context.theme.textTheme.headlineMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
  );
}

Widget addBudgetCart(BuildContext context) {
  return GestureDetector(
    onTap: () => FNavigator.displayBottomSheet(context, AddBudgetCart()),
    child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: FColors.primaryGrey.withOpacity(0.3), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: FColors.primaryGrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                FIcons.addIcon,
                color: FColors.primaryBlue,
              ),
            ),
            addHorizonSpace(5),
            Text(
              'Add new category',
              style: context.theme.textTheme.headlineMedium?.copyWith(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
  );
}

class AddBudgetCart extends StatelessWidget {
  AddBudgetCart({super.key});

  final TextEditingController budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          addVertSpace(5),
          Stack(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    FNavigator.popSheet();
                  },
                  icon: Align(
                    alignment: Alignment.topLeft,
                    child: FWidgetsRenderSvg(
                      iconColor: context.theme.textTheme.bodyLarge?.color,
                      iconPath: FIcons.cancel,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Account verification',
                  style: context.theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          addVertSpace(25),
          Text('Create a budget category that best suits  your budget plans.',
              style: context.theme.textTheme.bodyMedium),
          addVertSpace(30),
          FAuthTField(
            isFieldValidated: true,
            useOpacityForValidation: false,
            label: 'Category name',
            hintText: "Enter desired category name",
            textEditingController: budgetController,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100,
              child: TextButton(
                style: const ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick Category",
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          fontSize: 13.sp,
                          color: context.theme.textTheme.bodyLarge!.color!,
                        ),
                      ),
                      Row(
                        children: [
                        ...AddIconBudget.getIconTile.map(
                          (e) => AddIconBudget(
                            image: e.icon,
                            activeIndex: e.index,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
            buttonTitle: 'Continue',
            onPressed: () {
              FNavigator.navigateAndRemoveUntilRoute(const FCheckNavBar());
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Center(
                child: FWidgetsRenderSvg(
                  iconColor: FColors.white,
                  iconPath: FIcons.arrowRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
