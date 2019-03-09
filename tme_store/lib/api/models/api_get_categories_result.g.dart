// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_categories_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetCategoriesResult _$ApiGetCategoriesResultFromJson(
    Map<String, dynamic> json) {
  return ApiGetCategoriesResult(
      rootCategory: json['CategoryTree'] == null
          ? null
          : ApiCategory.fromJson(json['CategoryTree'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ApiGetCategoriesResultToJson(
        ApiGetCategoriesResult instance) =>
    <String, dynamic>{'CategoryTree': instance.rootCategory};
