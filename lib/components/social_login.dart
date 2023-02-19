import 'package:flutter/material.dart';
import 'package:food_scanner/components/space.dart';

import '../const/colors/color_res.dart';

Widget divider() {
  return Row(
    children: [
      const Expanded(child: Divider(thickness: 1)),
      doubleSpace(),
      const Text(
        "Or",
        style: TextStyle(color: ColorRes.secondary),
      ),
      doubleSpace(),
      const Expanded(child: Divider(thickness: 1))
    ],
  );
}