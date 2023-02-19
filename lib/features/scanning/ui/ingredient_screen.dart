import 'package:flutter/material.dart';
import 'package:food_scanner/features/recipe/recipe_list_screen.dart';
import 'package:food_scanner/features/scanning/model/ingredient.dart';
import 'package:provider/provider.dart';

class IngredientScreen extends StatefulWidget {
  const IngredientScreen({Key? key}) : super(key: key);

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of ingredients"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: context.watch<IngredientListModel>().ingredients.length + 1,
            itemBuilder: (context, index) {
              if (index == context.watch<IngredientListModel>().ingredients.length) {
                return ElevatedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue, side: const BorderSide(color: Colors.blue)),
                  child: const Text(
                    "Add ingredient",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return ListTile(
                title: Text(
                  context.watch<IngredientListModel>().ingredients[index].name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const IconButton(onPressed: null, icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () => context.read<IngredientListModel>().removeAtIndex(index),
                        icon: const Icon(Icons.delete))
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecipeListScreen()));
        },
        child: const Icon(Icons.chevron_right),
      ),
    );
  }
}
