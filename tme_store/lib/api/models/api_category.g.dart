// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCategory _$ApiCategoryFromJson(Map<String, dynamic> json) {
  return ApiCategory(
      id: json['Id'] as String,
      parentId: json['ParentId'] as String,
      depth: json['Depth'] as int,
      name: json['Name'] as String,
      totalProducts: json['TotalProducts'] as int,
      thumbnaillUrl: json['Thumbnail'] as String,
      subTreeCount: json['SubTreeCount'] as int,
      subTree: (json['SubTree'] as List)
          ?.map((e) => e == null
              ? null
              : ApiCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiCategoryToJson(ApiCategory instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ParentId': instance.parentId,
      'Depth': instance.depth,
      'Name': instance.name,
      'TotalProducts': instance.totalProducts,
      'Thumbnail': instance.thumbnaillUrl,
      'SubTreeCount': instance.subTreeCount,
      'SubTree': instance.subTree
    };
