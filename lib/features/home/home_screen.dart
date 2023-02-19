import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/features/recipe/recipe_list_screen.dart';
import 'package:food_scanner/features/scanning/ui/ingredient_scanning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _screen = const RecipeListScreen();
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    _selectedIndex = index;
    switch (index) {
      case 0:
        {
          setState(() {
            _screen = const RecipeListScreen();
          });
        }
        break;
      case 1:
        {
          await availableCameras().then((value) {
            setState(() {
              _screen = IngredientScanningScreen(cameras: value);
            });
          });
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _screen,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Scan")
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
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
