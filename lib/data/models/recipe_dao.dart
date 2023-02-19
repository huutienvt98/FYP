import 'package:json_annotation/json_annotation.dart';

part 'recipe_dao.g.dart';

@JsonSerializable()
class RecipeDao {
  final int id;
  final String title;
  final String image;
  final int servings;
  final int readyInMinutes;
  final int healthScore;

  RecipeDao(
      {required this.id,
      required this.title,
      required this.image,
      required this.servings,
      required this.readyInMinutes,
      required this.healthScore});

  factory RecipeDao.fromJson(Map<String, dynamic> json) => _$RecipeDaoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDaoToJson(this);
}
