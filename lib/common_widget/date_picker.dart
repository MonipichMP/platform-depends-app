import 'package:flutter/material.dart';

class DatePicker {
  onDatePicker(
    BuildContext context,
    DateTime initialDate,
    DateTime firstDate,
    DateTime lastDate,
  ) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}
