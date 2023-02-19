import 'package:flutter/material.dart';
import 'package:food_scanner/components/space.dart';
import 'package:food_scanner/domain/usecases/get_random_recipes_usecase.dart';
import 'package:food_scanner/features/recipe/recipe_detail_screen.dart';
import 'package:food_scanner/features/recipe/recipe_detail_screen_vm.dart';
import 'package:food_scanner/injection.dart';
import 'package:provider/provider.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  var useCase = getIt<IGetRandomRecipesUseCase>();

  Widget recipeImage(String url, int mins, int servings) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        singleSpace(),
                        Text(
                          servings.toString(),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                        singleSpace(),
                        Text(
                          "$mins min",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FutureBuilder(
          future: useCase.run(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () async {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                      context.read<RecipeDetailViewModel>().fetchRecipe(snapshot.data[index].id).then((_) =>
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const RecipeDetailScreen())));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        recipeImage(snapshot.data[index].image, snapshot.data[index].readyInMinutes,
                            snapshot.data[index].servings),
                        singleSpace(),
                        Text(
                          snapshot.data[index].title,
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        doubleSpace()
                      ]),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
