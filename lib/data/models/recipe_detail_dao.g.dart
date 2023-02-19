// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailDao _$RecipeDetailDaoFromJson(Map<String, dynamic> json) =>
    RecipeDetailDao(
      image: json['image'] as String,
      id: json['id'] as int,
      servings: json['servings'] as int,
      title: json['title'] as String,
      healthScore: json['healthScore'] as int,
      readyInMinutes: json['readyInMinutes'] as int,
      aggregateLikes: json['aggregateLikes'] as int,
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>)
          .map((e) => AnalyzedInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      cookingMinutes: json['cookingMinutes'] as int,
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>)
          .map((e) => ExtendedIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      preparationMinutes: json['preparationMinutes'] as int,
      veryPopular: json['veryPopular'] as bool,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$RecipeDetailDaoToJson(RecipeDetailDao instance) =>
    <String, dynamic>{
      'veryPopular': instance.veryPopular,
      'preparationMinutes': instance.preparationMinutes,
      'cookingMinutes': instance.cookingMinutes,
      'aggregateLikes': instance.aggregateLikes,
      'healthScore': instance.healthScore,
      'extendedIngredients':
          instance.extendedIngredients.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'image': instance.image,
      'nutrition': instance.nutrition.toJson(),
      'analyzedInstructions':
          instance.analyzedInstructions.map((e) => e.toJson()).toList(),
      'summary': instance.summary,
    };

ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    ExtendedIngredient(
      id: json['id'] as int,
      image: json['image'] as String,
      original: json['original'] as String,
      amount: (json['amount'] as num).toDouble(),
      unit: json['unit'] as String,
      originalName: json['originalName'] as String,
      measures: Measures.fromJson(json['measures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedIngredientToJson(ExtendedIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'original': instance.original,
      'originalName': instance.originalName,
      'amount': instance.amount,
      'unit': instance.unit,
      'measures': instance.measures.toJson(),
    };

Measures _$MeasuresFromJson(Map<String, dynamic> json) => Measures(
      us: Measure.fromJson(json['us'] as Map<String, dynamic>),
      metric: Measure.fromJson(json['metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeasuresToJson(Measures instance) => <String, dynamic>{
      'us': instance.us.toJson(),
      'metric': instance.metric.toJson(),
    };

Measure _$MeasureFromJson(Map<String, dynamic> json) => Measure(
      amount: (json['amount'] as num).toDouble(),
      unitShort: json['unitShort'] as String,
      unitLong: json['unitLong'] as String,
    );

Map<String, dynamic> _$MeasureToJson(Measure instance) => <String, dynamic>{
      'amount': instance.amount,
      'unitShort': instance.unitShort,
      'unitLong': instance.unitLong,
    };

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      nutrients: (json['nutrients'] as List<dynamic>)
          .map((e) => Nutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
      'nutrients': instance.nutrients.map((e) => e.toJson()).toList(),
    };

Nutrient _$NutrientFromJson(Map<String, dynamic> json) => Nutrient(
      amount: (json['amount'] as num).toDouble(),
      unit: json['unit'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$NutrientToJson(Nutrient instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };

AnalyzedInstruction _$AnalyzedInstructionFromJson(Map<String, dynamic> json) =>
    AnalyzedInstruction(
      name: json['name'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyzedInstructionToJson(
        AnalyzedInstruction instance) =>
    <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      number: json['number'] as int,
      step: json['step'] as String,
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
    };
