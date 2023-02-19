import 'package:flutter/foundation.dart';
import 'package:food_scanner/domain/usecases/get_recipe_detail_usecase.dart';

import '../../core/utils/change_notifier_property.dart';
import '../../domain/models/recipe_detail.dart';
import '../../injection.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final _useCase = getIt<IGetRecipeDetailUseCase>();

  late final recipe = Property<RecipeDetail>(
      RecipeDetail(
          readyInMinutes: 0,
          title: "",
          servings: 0,
          imgUrl: "",
          ingredients: List.empty(),
          calories: 0,
          instructions: List.empty(),
          summary: ""),
      notifyListeners);

  Future<void> fetchRecipe(int id) async {
    recipe.value = await _useCase.run(id);
  }
}
