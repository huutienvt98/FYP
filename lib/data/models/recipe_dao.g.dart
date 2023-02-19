// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDao _$RecipeDaoFromJson(Map<String, dynamic> json) => RecipeDao(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      servings: json['servings'] as int,
      readyInMinutes: json['readyInMinutes'] as int,
      healthScore: json['healthScore'] as int,
    );

Map<String, dynamic> _$RecipeDaoToJson(RecipeDao instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'servings': instance.servings,
      'readyInMinutes': instance.readyInMinutes,
      'healthScore': instance.healthScore,
    };
