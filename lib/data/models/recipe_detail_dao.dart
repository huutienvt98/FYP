import 'package:json_annotation/json_annotation.dart';

part 'recipe_detail_dao.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDetailDao {
  final bool veryPopular;
  final int preparationMinutes;
  final int cookingMinutes;
  final int aggregateLikes;
  final int healthScore;
  final List<ExtendedIngredient> extendedIngredients;
  final int id;
  final String title;
  final int readyInMinutes;
  final int servings;
  final String image;
  final Nutrition nutrition;
  final List<AnalyzedInstruction> analyzedInstructions;
  final String summary;

  RecipeDetailDao(
      {required this.image,
      required this.id,
      required this.servings,
      required this.title,
      required this.healthScore,
      required this.readyInMinutes,
      required this.aggregateLikes,
      required this.analyzedInstructions,
      required this.cookingMinutes,
      required this.extendedIngredients,
      required this.nutrition,
      required this.preparationMinutes,
      required this.veryPopular,
      required this.summary});

  factory RecipeDetailDao.fromJson(Map<String, dynamic> json) => _$RecipeDetailDaoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailDaoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExtendedIngredient {
  final int id;
  final String image;
  final String original;
  final String originalName;
  final double amount;
  final String? unit;
  final Measures measures;

  ExtendedIngredient(
      {required this.id,
      required this.image,
      required this.original,
      required this.amount,
      required this.unit,
      required this.originalName,
      required this.measures});

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => _$ExtendedIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendedIngredientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Measures {
  final Measure us;
  final Measure metric;

  Measures({required this.us, required this.metric});

  factory Measures.fromJson(Map<String, dynamic> json) => _$MeasuresFromJson(json);

  Map<String, dynamic> toJson() => _$MeasuresToJson(this);
}

@JsonSerializable()
class Measure {
  final double amount;
  final String unitShort;
  final String unitLong;

  Measure({required this.amount, required this.unitShort, required this.unitLong});

  factory Measure.fromJson(Map<String, dynamic> json) => _$MeasureFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Nutrition {
  final List<Nutrient> nutrients;

  Nutrition({required this.nutrients});

  factory Nutrition.fromJson(Map<String, dynamic> json) => _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);
}

@JsonSerializable()
class Nutrient {
  final String name;
  final double amount;
  final String unit;

  Nutrient({required this.amount, required this.unit, required this.name});

  factory Nutrient.fromJson(Map<String, dynamic> json) => _$NutrientFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnalyzedInstruction {
  final List<Step> steps;
  final String name;

  AnalyzedInstruction({required this.name, required this.steps});

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => _$AnalyzedInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzedInstructionToJson(this);
}

@JsonSerializable()
class Step {
  final int number;
  final String step;

  Step({required this.number, required this.step});

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}
