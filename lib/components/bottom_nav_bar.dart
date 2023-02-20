import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/components/bottom_nav_bar_selected_index.dart';
import 'package:provider/provider.dart';

import '../features/recipe/recipe_list_screen.dart';
import '../features/scanning/ui/ingredient_scanning_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Recipes"),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Scan")
      ],
      onTap: (index) {
        onItemTapped(index, context);
        context.read<BottomNavBarIndex>().setIndex(index);
      },
      currentIndex: context.watch<BottomNavBarIndex>().index.value,
    );
  }
}

void onItemTapped(int index, BuildContext context) async {
  switch (index) {
    case 0:
      {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const RecipeListScreen()));
      }
      break;
    case 1:
      {
        await availableCameras().then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => IngredientScanningScreen(cameras: value)));
        });
      }
  }
}
