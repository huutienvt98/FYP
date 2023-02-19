import 'package:flutter/material.dart';
import 'package:food_scanner/components/space.dart';
import 'package:food_scanner/const/colors/color_res.dart';
import 'package:food_scanner/domain/models/recipe_detail.dart';
import 'package:food_scanner/features/recipe/recipe_detail_screen_vm.dart';
import 'package:fraction/fraction.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height * 0.33;

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<RecipeDetailViewModel>(
        builder: (context, watch, child) {
          final recipe = watch.recipe.value;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: imageHeight,
                    decoration:
                        BoxDecoration(image: DecorationImage(image: NetworkImage(recipe.imgUrl), fit: BoxFit.cover)),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                            textAlign: TextAlign.start,
                          ),
                          doubleSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              recipeInfo(const Icon(Icons.timer_sharp), "${recipe.readyInMinutes.toString()} min"),
                              recipeInfo(const Icon(Icons.people_alt_outlined), "${recipe.servings.toString()} pax"),
                              recipeInfo(const Icon(Icons.local_fire_department_rounded),
                                  "${recipe.calories.toInt().toString()} cal")
                            ],
                          ),
                          doubleSpace(),
                          // Html(
                          //   data: recipe.summary,
                          //   tagsList: Html.tags,
                          // ),
                          const Text(
                            "Ingredients",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          singleSpace(),
                          getIngredients(recipe.ingredients),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Instructions",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          singleSpace(),
                          getInstructions(recipe.instructions)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget recipeInfo(Icon icon, String info) {
    return Row(
      children: [
        icon,
        singleSpace(),
        Text(
          info,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        )
      ],
    );
  }

  Widget getIngredients(List<IngredientDetail> ingredients) {
    List<Widget> widgets = [];
    for (var element in ingredients) {
      var row = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("•  ", style: TextStyle(color: ColorRes.primary)),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: "${Fraction.fromDouble(element.amount).toString()} ${element.unit}  ",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: element.name)
          ])),
        )
      ]);
      widgets.add(row);
    }
    return Column(
      children: widgets,
    );
  }

  Widget getInstructions(List<Instruction> instructions) {
    List<Widget> widgets = [];
    for (var i in instructions) {
      var row = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("${i.number.toString()}.  ", style: const TextStyle(color: ColorRes.primary, fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(i.step),
        )
      ]);
      widgets.add(row);
    }
    return Column(
      children: widgets,
    );
  }
}
