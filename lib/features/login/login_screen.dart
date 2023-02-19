import 'package:flutter/material.dart';
import 'package:food_scanner/components/input_field.dart';
import 'package:food_scanner/components/space.dart';
import 'package:food_scanner/const/colors/color_res.dart';
import 'package:food_scanner/const/strings/string_res.dart';
import 'package:food_scanner/features/home/home_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../components/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              StringRes.login,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                          labelText: StringRes.email),
                      validator: MultiValidator([
                        RequiredValidator(errorText: StringRes.requiredFieldError),
                        EmailValidator(errorText: StringRes.invalidEmailError)
                      ]),
                    ),
                    doubleSpace(),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                          labelText: StringRes.password),
                      obscureText: true,
                      validator: MultiValidator([
                        RequiredValidator(errorText: StringRes.requiredFieldError),
                        EmailValidator(errorText: StringRes.passwordTooShort)
                      ]),
                    ),
                    doubleSpace(),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48.0), backgroundColor: ColorRes.primary),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ))
                  ],
                )),
            doubleSpace(),
            divider()
          ],
        ),
      ),
    );
  }
}
