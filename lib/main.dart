import 'package:flutter/material.dart';
import 'package:food_scanner/const/colors/color_res.dart';
import 'package:food_scanner/features/login/login_screen.dart';
import 'package:food_scanner/features/recipe/recipe_detail_screen_vm.dart';
import 'package:food_scanner/features/scanning/model/ingredient.dart';
import 'package:provider/provider.dart';

import 'injection.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => IngredientListModel()),
    ChangeNotifierProvider(create: (_) => RecipeDetailViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: ColorRes.primary),
          fontFamily: 'Mulish',
        ),
        home: const LoginScreen());
  }
}
