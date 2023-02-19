import 'dart:convert';

import 'package:food_scanner/data/repository/recipes_repo.dart';
import 'package:food_scanner/data/models/recipe_dao.dart';
import 'package:injectable/injectable.dart';

abstract class IGetRandomRecipesUseCase {
  Future<List<RecipeDao>> run();
}

@Injectable(as: IGetRandomRecipesUseCase)
class GetRandomRecipesUseCaseImpl implements IGetRandomRecipesUseCase {
  final IRecipesRepo _repo;

  GetRandomRecipesUseCaseImpl(this._repo);

  @override
  Future<List<RecipeDao>> run() async {
    final response = await _repo.getRandomRecipes();
    if (response.statusCode == 200) {
      final recipesJson = jsonDecode(response.body)["recipes"];
      List<RecipeDao> recipes = List.from(recipesJson.map((r) => RecipeDao.fromJson(r)));
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
