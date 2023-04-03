

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 final budgetProvider = Provider((ref) => BudgetProvider());

class BudgetProvider extends StateNotifier<BudgetModel> {
  BudgetProvider() : super(BudgetModel());

  static bool isButtonEnabled = false;
  bool get isButtonEnabledGetter => isButtonEnabled;

  static bool amountField = false;
  bool get amountFieldGetter => amountField;
  static bool startField = false;
  bool get startFieldGetter => startField;
  static bool endField = false;
  bool get endFieldGetter => endField;

  // static DateTime? pickedDate;
  // DateTime? get pickedDateGetter => pickedDate;

  checkDate(){
    
  }


  checkTextField() {
    if (amountField && startField && endField) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
     state.copyWith(pickedDate: value);
  state.pickedDate  = value;
    });
    checkTextField();
  }
}

class BudgetModel {
  DateTime? pickedDate;
  BudgetModel({
    this.pickedDate,
  });

  BudgetModel copyWith({
    DateTime? pickedDate,
  }) {
    return BudgetModel(
      pickedDate: pickedDate ?? this.pickedDate,
    );
  }
}



 

