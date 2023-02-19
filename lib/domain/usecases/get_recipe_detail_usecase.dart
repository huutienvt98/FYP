import 'dart:convert';

import 'package:food_scanner/data/models/recipe_detail_dao.dart';
import 'package:food_scanner/domain/models/recipe_detail.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/recipes_repo.dart';

abstract class IGetRecipeDetailUseCase {
  Future<RecipeDetail> run(int id);
}

@Injectable(as: IGetRecipeDetailUseCase)
class GetRecipeDetailUseCaseImpl implements IGetRecipeDetailUseCase {
  final IRecipesRepo _repo;

  GetRecipeDetailUseCaseImpl(this._repo);

  @override
  Future<RecipeDetail> run(int id) async {
    final response = await _repo.getRecipeDetail(id: id);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final dao = RecipeDetailDao.fromJson(json);
      RecipeDetail recipeDetail = RecipeDetail(
          readyInMinutes: dao.readyInMinutes,
          title: dao.title,
          servings: dao.servings,
          imgUrl: dao.image,
          ingredients: dao.extendedIngredients
              .map((i) =>
                  IngredientDetail(detail: i.original, name: i.originalName, amount: i.amount, unit: i.unit ?? ""))
              .toList(),
          calories: dao.nutrition.nutrients.firstWhere((it) => it.name == "Calories").amount,
          instructions:
              dao.analyzedInstructions[0].steps.map((it) => Instruction(number: it.number, step: it.step)).toList(),
          summary: dao.summary);
      return recipeDetail;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
