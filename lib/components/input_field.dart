import 'package:flutter/material.dart';
import 'package:food_scanner/core/utils/input_validator.dart';

Widget inputField() {
  return TextField(
    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    onChanged: InputValidator.emailValid,
  );
}
