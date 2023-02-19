class RecipeDetail {
  final String imgUrl;
  final String title;
  final int readyInMinutes;
  final int servings;
  final double calories;
  final List<IngredientDetail> ingredients;
  final List<Instruction> instructions;
  final String summary;

  RecipeDetail(
      {required this.readyInMinutes,
      required this.title,
      required this.servings,
      required this.imgUrl,
      required this.ingredients,
      required this.calories,
      required this.instructions,
      required this.summary});
}

class IngredientDetail {
  final String detail;
  final String name;
  final double amount;
  final String unit;

  IngredientDetail({required this.detail, required this.name, required this.amount, required this.unit});
}

class Instruction {
  final int number;
  final String step;

  Instruction({required this.number, required this.step});
}
