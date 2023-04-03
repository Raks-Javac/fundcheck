// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fundcheck/src/shared/res/res.dart';

class BudgetCartModel {
  String? label;
  String? image;
  bool isFirst;
  BudgetCartModel({
    this.label,
    this.image,
    this.isFirst = false,
  });

  static List<BudgetCartModel> getBudgetCart() {
    return [
      BudgetCartModel(
       isFirst: true
      ),
      BudgetCartModel(
       image: FIcons.foodIcon,
       label: 'Food',
      ),
       BudgetCartModel(
       image: FIcons.gadgetIcon,
       label: 'Gadget',
      ),
       BudgetCartModel(
       image: FIcons.healthIcon,
       label: 'Health',
      ),
       BudgetCartModel(
       image: FIcons.jewelryIcon,
       label: 'Jewelries',
      ),
       BudgetCartModel(
       image: FIcons.savingIcon,
       label: 'Savings',
      ),
       BudgetCartModel(
       image: FIcons.transportIcon,
       label: 'Transport',
      ),
       BudgetCartModel(
       image: FIcons.travelIcon,
       label: 'Travel',
      ),
       BudgetCartModel(
       image: FIcons.upkeepIcon,
       label: 'Upkeep',
      ),
       BudgetCartModel(
       image: FIcons.utilityIcon,
       label: 'Utilities',
      ),
       BudgetCartModel(
       image: FIcons.billIcon,
       label: 'Bills',
      ),
       BudgetCartModel(
       image: FIcons.clothIcon,
       label: 'Cloth',
      ),
       BudgetCartModel(
       image: FIcons.costmeticIcon,
       label: 'Cosmetics',
      ),
       BudgetCartModel(
       image: FIcons.eduIcon,
       label: 'Education',
      ),
       BudgetCartModel(
       image: FIcons.entertainmentIcon,
       label: 'Entertainment',
      ),
    ];
  }
}
