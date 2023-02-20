import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/features/recipe/recipe_list_screen.dart';
import 'package:food_scanner/features/scanning/ui/ingredient_scanning_screen.dart';

import '../../components/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const RecipeListScreen(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
//
// Center(
// child: ElevatedButton(
// onPressed: () async {
// await availableCameras().then((value) => Navigator.of(context).push(
// MaterialPageRoute(builder: (context) => IngredientScanningScreen(cameras: value)),
// ));
// },
// child: const Text("Scan"),
// ),
// );
