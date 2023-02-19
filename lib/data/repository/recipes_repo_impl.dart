import 'package:food_scanner/data/repository/recipes_repo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../api/api.dart';

@Injectable(as: IRecipesRepo)
class RecipesRepoImpl implements IRecipesRepo {
  @override
  Future<http.Response> getRandomRecipes() async {
    print(Uri.parse(API.getRandomRecipeApi));
    return http.get(Uri.parse(API.getRandomRecipeApi));
  }

  @override
  Future<http.Response> getRecipeDetail({required int id}) async {
    final queryParameters = {"id": id.toString()};
    final uri = Uri.http("10.0.2.2:8080", "/recipes/detail", queryParameters);
    print(uri);
    return http.get(uri);
  }
}
