import 'package:food_scanner/const/const.dart';

class InputValidator {
  static bool emailValid(String input) {
    return RegExp(Const.emailRegex).hasMatch(input);
  }
}
