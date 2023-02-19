import 'package:http/http.dart' as http;

abstract class IRecipesRepo {
  Future<http.Response> getRandomRecipes();

  Future<http.Response> getRecipeDetail({required int id});
}
